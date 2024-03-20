#include <bits/stdc++.h>

using namespace std;

struct frecventaPereche{
    int frecventa = 0;
    char ch = '\0';

    bool operator <(const frecventaPereche& ot) const {
        return this->frecventa < ot.frecventa || (this->frecventa == ot.frecventa && this->ch < ot.ch);
    }
};

class Graf{
private:
    string text;
    string decodat;
    map<string, char> coduri;
    int litere = 0;

    multimap<frecventaPereche, string> codare;

public:
    Graf() = default;

    string compresie(const string& t) {
        this->text = t;

        if(t.empty()) {
            return {};
        }

        int frecventa[256]{};

        for(auto& ch: text) {
            frecventa[int(ch)]++;
            if(frecventa[int(ch)] == 1) {
                ++litere;
            }
        }

        for(int i = 0; i < 256; i++) {
            if(frecventa[i]) {
                this->codare.insert({{frecventa[i], char(i)}, string(1,i)});
            }
        }

        string cod[256]{};
        while(--litere){
            auto x = *this->codare.begin();
            this->codare.erase(this->codare.begin());

            for(auto& ch: x.second) {
                cod[int(ch)] = "0" + cod[int(ch)];
            }

            auto y = *this->codare.begin();
            this->codare.erase(this->codare.begin());

            for(auto &ch: y.second) {
                cod[int(ch)] = "1" + cod[int(ch)];
            }

            this->codare.insert({{x.first.frecventa + y.first.frecventa, min(x.first.ch, y.first.ch)}, x.second + y.second});
        }

        for(int i = 0; i < 256; i++) {
            if(cod[i] != "\0") {
                this->coduri.insert({cod[i], char(i)});
            }
        }

        for(char& ch: text) {
            this->decodat.append(cod[int(ch)]);
        }

        return decodat;
    }
    string decompresie() {
        if(this->decodat.empty()) {
            return {};
        }

        string decodare;
        string codCurent;
        int index = 0;
        bool gasit = false;

        while(!this->decodat.empty()) {
            gasit = false;
            codCurent += decodat[index];

            for(auto& cod: coduri) {
                if(codCurent == cod.first) {
                    decodare.append(string(1, cod.second));

                    this->decodat.erase(decodat.find(codCurent), codCurent.length());

                    codCurent.clear();
                    index = 0;
                    gasit = true;

                    break;
                }
            }

            if(!gasit) {
                ++index;
            }
        }
        return decodare;
    }
};

int main() {
    Graf graf;
    string text = "Treeaaassuureee";
    string CODAT = graf.compresie(text);
    cout << text << " " << CODAT << "\n";
    string DECODAT = graf.decompresie();
    cout << CODAT << " " << DECODAT << "\n";
    return 0;
}
