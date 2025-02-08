#include "Varianta0.h"

void adunaNumereMariSecvential() {

    vector<int> numar1 = citesteNumarDinFisier("Numar1.txt");
    vector<int> numar2 = citesteNumarDinFisier("Numar2.txt");
    
    int N1 = numar1.size();
    int N2 = numar2.size();
    int N = std::max(N1, N2);
    vector<int> rezultat;
    int carry = 0;

    for (int i = 0; i < N; ++i) {
        int cifra1 = i < N1 ? numar1[i] : 0;
        int cifra2 = i < N2 ? numar2[i] : 0;
        int suma = cifra1 + cifra2 + carry;
        rezultat.push_back(suma % 10);
        carry = suma / 10;
    }
    if (carry) {
        rezultat.push_back(carry);
    }

    scrieNumarInFisier(rezultat, "RezultatSecvential.txt");
    
}