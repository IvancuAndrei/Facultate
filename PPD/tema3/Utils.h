#pragma once
#include <fstream>
#include <vector>

using namespace std;

vector<int> citesteNumarDinFisier(const string& filename);

void scrieNumarInFisier(const vector<int>& numar, const string& filename);