#include <bits/stdc++.h>
using namespace std;

int MAX = 1000000;

void suma_secventiala(double* v1, double* v2, double* v3, int start, int end) {
    for (int i = start; i < end; i++) {
        v3[i] = v1[i] + v2[i];
    }
}

void suma_paralela(double* v1, double* v2, double* v3, int size, int nr_threads) {
    thread* threads = new thread[nr_threads];
    int start = 0;
    int workload = size / nr_threads;
    int rest = size % nr_threads;

    for(int i = 0; i < nr_threads; i++) {
        int end = start + workload;
        if(rest > 0) {
            end++;
            rest--;
        }
        threads[i] = thread(&suma_secventiala, v1, v2, v3, start, end);
        start = end;
    }

    for(int i = 0; i < nr_threads; i++) {
        threads[i].join();
    }
}

void suma_ciclica(double* v1, double* v2, double* v3, int size, int nr_threads) {
    vector<thread*> threads = vector<thread*>();

    for(int i = 0; i < nr_threads; i+=nr_threads) {
        thread *t = new thread([&](double v1[], double v2[], double v3[], int start, int end) {
            for(int i = start; i < end; i ++) {
                v3[i] = v1[i] + v2[i];

            }
        }, v1, v2, v3, i, size);
        threads.push_back(t);
    }

    for(int i = 0; i < nr_threads; i++) {
        threads[i]->join();
        delete threads[i];
    }




}

int main() {
    int nr_threads = 4;

    double* a = new double[MAX];
    double* b = new double[MAX];
    double* c = new double[MAX];

    for(int i = 0; i < MAX; i++) {
        a[i] = i;
        b[i] = 2 * i;
    }

    auto start = chrono::high_resolution_clock::now();
    suma_secventiala(a, b, c, 0, MAX);
    auto end = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::microseconds>(end - start);
    cout << "Secvential: " << duration.count() << endl;

    delete[] c;
    double *c2 = new double[MAX];

    auto start2 = chrono::high_resolution_clock::now();
    suma_paralela(a, b, c2, MAX, nr_threads);
    auto end2 = chrono::high_resolution_clock::now();
    auto duration2 = chrono::duration_cast<chrono::microseconds>(end2 - start2);
    cout << "Paralela: " << duration2.count() << endl;

    delete[] a;
    delete[] b;
    delete[] c2;
}
