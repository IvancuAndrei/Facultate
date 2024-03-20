#include<iostream>
#include<fstream>

using namespace std;

ifstream in("intrare.txt");
ofstream out("iesire.txt");

long long int pi[100001];
long long int prufer[100001];

long long int frunza_minima(int n) {
    long long int frmin = 0;
    int i = 0;
    while (i < n) {
        if (frmin == pi[i]) {
            frmin++;
            i = 0;
        }
        i++;
    }
    return frmin;
}

int main() {
    int n;
    in >> n;
    for (int i = 0; i < n; i++) {
        in >> pi[i];
    }
    for (int i = 0; i < n - 1; i++) {
        int fm = frunza_minima(n);
        prufer[i] = pi[fm];
        pi[fm] = fm;
    }
    out << n - 1 << endl;
    for (int i = 0; i < n - 1; i++) {
        out << prufer[i] << " ";
    }
}