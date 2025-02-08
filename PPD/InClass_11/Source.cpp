#include <iostream>
#include <omp.h>
#include <chrono>

using namespace std;

void suma_vect_secv(int* a, int* b, int* rez, int n) {
    for (int i = 0; i < n; i++) {
        rez[i] = a[i] + b[i];
    }
}

void suma_vect_paralel(int threads, int* a, int* b, int* rez, int n) {
    int i;
    omp_set_num_threads(threads);
#pragma omp parallel for default(none) shared(a, b, rez, n) private(i) schedule(guided, 5)
    for (i = 0; i < n; i++) {
        rez[i] = a[i] + b[i];
    }
    /*  for (i = 0; i < n; i++) {
          cout <<  "A: " << a[i] << " , ";
          cout <<  "B: " << b[i] << " , ";
          cout <<  "C:" << rez[i] << " , ";
          cout << endl;
      }*/
}

void prod_vect_secv(int* a, int* b, int* rez, int n) {
    for (int i = 0; i < n; i++) {
        rez[i] = a[i] * b[i];
    }
}

void prod_vect_paralel(int threads, int* a, int* b, int* rez, int n) {
    int i;
    omp_set_num_threads(threads);
#pragma omp parallel for default(none) shared(a, b, rez, n) private(i) schedule(static)
    for (i = 0; i < n; i++) {
        rez[i] = a[i] * b[i];
    }
    /*for (i = 0; i < n; i++) {
        cout << "A: " << a[i] << " , ";
        cout << "B: " << b[i] << " , ";
        cout << "C:" << rez[i] << " , ";
        cout << endl;
    }*/
}

void vectorial_prod_vect_reduction(int threads, int* a, int* b, int& rez, int n) {
    int i, sum = 0;
    omp_set_num_threads(threads);
#pragma omp parallel for default(none) shared(a, b, n) private(i) reduction(+:sum)
    for (i = 0; i < n; i++) {
        sum += a[i] * b[i];
    }
    rez = sum;
}

void vectorial_prod_vect_secv(int* a, int* b, int& rez, int n) {
    rez = 0;
    for (int i = 0; i < n; i++) {
        rez += a[i] * b[i];
    }
}

void vectorial_prod_vect_paralel(int threads, int* a, int* b, int& rez, int n) {
    int i, rez_local = 0;
    omp_set_num_threads(threads);
#pragma omp parallel default(none) shared(a, b, rez, n) private(i, rez_local)
    {
#pragma omp for
        for (i = 0; i < n; i++) {
            rez_local += a[i] * b[i];
        }
#pragma omp critical
        rez += rez_local;
    }
}

void sum_matrix_secv(int** a, int** b, int** rez, int m, int n) {
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            rez[i][j] = a[i][j] + b[i][j];
        }
    }
}

void sum_matrix_parallel(int threads, int** a, int** b, int** rez, int m, int n) {
    omp_set_num_threads(threads);
#pragma omp parallel for collapse(2) shared(a, b, rez, m, n)
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            rez[i][j] = a[i][j] + b[i][j];
        }
    }
}


void run_with_sections(int* a, int* b, int* rez_suma, int n, int& rez_vectorial,
    int** mat_a, int** mat_b, int** mat_rez, int mat_m, int mat_n) {
    omp_set_num_threads(4);
#pragma omp parallel sections
    {
#pragma omp section
        suma_vect_secv(a, b, rez_suma, n);
#pragma omp section
        vectorial_prod_vect_secv(a, b, rez_vectorial, n);
#pragma omp section
        sum_matrix_secv(mat_a, mat_b, mat_rez, mat_m, mat_n);
    }
}


int main() {
    int mat_m = 10000;
    int mat_n = 10000;
    auto** mat_a = new int* [mat_m];
    auto** mat_b = new int* [mat_m];
    auto** mat_rez = new int* [mat_m];

    for (int i = 0; i < mat_m; i++) {
        mat_a[i] = new int[mat_n];
        mat_b[i] = new int[mat_n];
        mat_rez[i] = new int[mat_n];
        for (int j = 0; j < mat_n; j++) {
            mat_a[i][j] = i % 10;
            mat_b[i][j] = j % 10;
        }
    }

    int n = 1000000;
    int* a = new int[n];
    int* b = new int[n];
    int* rez = new int[n];
    int* rez_paralel = new int[n];

    for (int i = 0; i < n; i++) {
        a[i] = b[i] = i % 10;
    }

    // Suma vectori
    auto start = chrono::system_clock::now();
    suma_vect_secv(a, b, rez, n);
    auto end = chrono::system_clock::now();
    cout << "Timp secvential suma vectori: " << chrono::duration<double, milli>(end - start).count() << " ms\n";

    start = chrono::system_clock::now();
    suma_vect_paralel(4, a, b, rez_paralel, n);
    end = chrono::system_clock::now();
    cout << "Timp paralel suma vectori: " << chrono::duration<double, milli>(end - start).count() << " ms\n";

    // Produs vectorial
    int r = 0, r_p = 0;
    start = chrono::system_clock::now();
    vectorial_prod_vect_secv(a, b, r, n);
    end = chrono::system_clock::now();
    cout << "Timp secvential produs vectorial: " << chrono::duration<double, milli>(end - start).count() << " ms\n";

    start = chrono::system_clock::now();
    vectorial_prod_vect_reduction(4, a, b, r_p, n);
    end = chrono::system_clock::now();
    cout << "Timp paralel produs vectorial (reduction): " << chrono::duration<double, milli>(end - start).count() << " ms\n";

    start = chrono::system_clock::now();
    prod_vect_paralel(4, a, b, rez, n);
    end = chrono::system_clock::now();
    cout << "Timp paralel produs vectorial static: " << chrono::duration<double, milli>(end - start).count() << " ms\n";

    // Suma matrici
    start = chrono::system_clock::now();
    sum_matrix_secv(mat_a, mat_b, mat_rez, mat_m, mat_n);
    end = chrono::system_clock::now();
    cout << "Timp secvential suma matrici: " << chrono::duration<double, milli>(end - start).count() << " ms\n";

    start = chrono::system_clock::now();
    sum_matrix_parallel(8, mat_a, mat_b, mat_rez, mat_m, mat_n);
    end = chrono::system_clock::now();
    cout << "Timp paralel suma matrici: " << chrono::duration<double, milli>(end - start).count() << " ms\n";

    start = chrono::system_clock::now();
    run_with_sections(a, b, rez, n, r, mat_a, mat_b, mat_rez, mat_m, mat_n);
    end = chrono::system_clock::now();
    cout << "Timp sections: " << chrono::duration<double, milli>(end - start).count() << " ms\n";

}