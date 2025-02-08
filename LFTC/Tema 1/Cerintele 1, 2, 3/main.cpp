#include <bits/stdc++.h>
#include "probleme\probleme.h"

using namespace std;

ifstream fin("D:\\Facultate - Github\\Facultate\\LFTC\\Tema 1\\Cerintele 1, 2, 3\\input.txt");

bool isOperator(char c) {
    string operators = "+-*/=><!&|%^";
    return operators.find(c) != string::npos;
}

bool isDelimiter(char c) {
    string delimiters = " ;{}()[],";
    return delimiters.find(c) != string::npos;
}

void tokenize(string code) {
    vector<string> tokens;
    string token = "";

    for (size_t i = 0; i < code.length(); ++i) {
        char c = code[i];

        if (isspace(c)) {
            if (!token.empty()) {
                tokens.push_back(token);
                token.clear();
            }
            continue;
        }

        if (isOperator(c)) {
            if (!token.empty()) {
                tokens.push_back(token);
                token.clear();
            }
            if (i + 1 < code.length() && isOperator(code[i + 1])) {
                tokens.push_back(string(1, c) + string(1, code[i + 1]));
                i++;
            } else {
                tokens.push_back(string(1, c));
            }
            continue;
        }

        if (isDelimiter(c)) {
            if (!token.empty()) {
                tokens.push_back(token);
                token.clear();
            }
            tokens.push_back(string(1, c));
            continue;
        }

        token += c;
    }

    if (!token.empty()) {
        tokens.push_back(token);
    }


    cout << "Atomii detectați sunt: \n";
    bool first = true;
    for (const auto& t : tokens) {
        if (!first) {
            cout << ", ";
        }
        cout << "\"" << t << "\"";
        first = false;
    }
    cout << endl;
}

void analizator(){
    if (!fin) {
        cerr << "Nu s-a putut deschide fișierul!\n";
        return;
    }

    string code, line;
    while (getline(fin, line)) {
        code += line + '\n';
    }

    fin.close();


    tokenize(code);
}

void probleme(){
    problema_1(3);
    problema_2(15, 35);
    problema_3(7);
    problema_gresita('c', 5);

}


int main(){

    //probleme();
    analizator();

    return 0;

}