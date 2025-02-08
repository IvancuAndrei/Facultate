#include "Utils.h"

vector<int> citesteNumarDinFisier(const string& filename) {
    ifstream file(filename);
    string numar_str;
    int N;

    file >> N;
    file >> numar_str;


    vector<int> numar(numar_str.size());


    for (int i = 0; i < N; i++) {
        numar[i] = numar_str[i] - '0';
    }


    reverse(numar.begin(), numar.end());

    return numar;
}

void scrieNumarInFisier(const vector<int>& numar, const string& filename) {
    ofstream file(filename);
    file << numar.size() << "\n";
    for (auto it = numar.rbegin(); it != numar.rend(); ++it) {
        file << *it;
    }
    file << "\n";
}