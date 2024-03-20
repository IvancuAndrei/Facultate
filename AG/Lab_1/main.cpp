#include <bits/stdc++.h>
using namespace std;
ifstream f("in.txt");
ifstream fin("problema2.txt");

int n;
int ma[25][25]; // matrice de adiacenta
int mi[25][35]; // matrice de incidenta
int l[25][25]; // lista adiacenta
int d[25][25]; // matricea de distante
char line[256];

void problema1() {


    int x, y, i, j, k, col;

    //citire
    f>>n;
    while(f>>x>>y)
        ma[x][y] = ma[y][x] = 1;

    //matrice de adiacenta
    cout << "Matricea de adiacenta:" << "\n";
    for(i = 1; i <= n; i++) {
        for(j = 1; j <= n; j++)
            cout << ma[i][j] << " ";
        cout << "\n";
    }

    //lista adiacenta
    cout << "Matrice de adiacenta -> Lista de adiacenta" << "\n";
    for(i = 1; i <= n; i++) {
        k = 0;
        for (j = 1; j <= n; j++)
            if (ma[i][j])
                l[i][++k] = j;
    }
    for(i = 1; i <= n; i++){
        cout << i << ": ";
        j = 1;
        while(l[i][j]) {
            if (l[i][j + 1] == 0)
                cout << l[i][j];
            else
                cout << l[i][j] << ", ";
            j++;
        }
        cout << "\n";
    }

    //matrice de incidenta
    cout << "Lista adiacenta -> Matricea de incidenta:" << "\n";
    col = 0;
    for(i = 1; i <= n; i++) {
        j = 1;
        while (l[i][j]) {
            if (i < l[i][j]) {
                col++;
                mi[i][col] = mi[l[i][j]][col] = 1;
            }
            j++;
        }
    }
    for(i = 1; i <= n; i++) {
        for (j = 1; j <= col; j++)
            cout << mi[i][j] << " ";
        cout << "\n";
    }

    //lista adiacenta
    cout << "Matricea de incidenta -> Lista adiacenta" << "\n";
    for(i = 1; i <= n; i++){
        cout << i << ": ";
        j = 1;
        while(l[i][j]) {
            if (l[i][j + 1] == 0)
                cout << l[i][j];
            else
                cout << l[i][j] << ", ";
            j++;
        }
        cout << "\n";
    }

    //matrice adiacenta
    cout << "Lista adiacenta -> Matricea de adiacenta:" << "\n";
    for(i = 1; i <= n; i++) {
        for(j = 1; j <= n; j++)
            cout << ma[i][j] << " ";
        cout << "\n";
    }

    //lista
    cout << "Matricea de adiacenta -> Lista" << "\n";
    for(i = 1; i <= n; i++)
        for(j = 1; j <= n; j++)
            if(ma[i][j] && i < j)
                cout << i << " " << j << "\n";

}

void problema2() {
//    Alegem modul(reprezentat prin variabila int mod) de reprezentare a grafului:
//    - 1 (lista): scriem numarul de noduri si muchiile pe rand in fisierul text
//    - 2 (matrice de adiacenta): scriem numarul de noduri si matricea de adiacenta in fisierul text
//    - 3 (lista de adiacenta) : scriem numarul de noduri si lista de adiacenta a fiecaruia in fisierul text
//    - 4 (matricea de incidenta) : scriem numarul de noduri, muchii si matricea de incidenta in fisierul text


    int mod, x, y, ok, i, j, gradmax = 0, grad, m;
    fin >> mod;

    if (mod == 1) {
        fin >> n;
        while (fin >> x >> y)
            ma[x][y] = ma[y][x] = 1;

        cout << "a) ";
        for (i = 1; i <= n; i++) {
            ok = 1;
            for (j = 1; j <= n; j++)
                if (ma[i][j])
                    ok = 0;
            if (ok)
                cout << i << ", ";
        }
        if (ok == 0)
            cout << "Nu exista";
        cout << "\n";

        cout << "b) ";
        for (i = 1; i <= n; i++)
            if (ma[1][i])
                gradmax++;
        ok = 1;
        for (i = 1; i <= n; i++) {
            grad = 0;
            for (j = 1; j <= n; j++)
                if (ma[i][j])
                    grad++;
            if (grad != gradmax)
                ok = 0;
        }
        if (ok == 1)
            cout << "Da\n";
        else cout << "Nu\n";

    } else if (mod == 2) {
        fin >> n;
        for (i = 1; i <= n; i++)
            for (j = 1; j <= n; j++)
                fin >> ma[i][j];

        cout << "a) ";
        for (i = 1; i <= n; i++) {
            ok = 1;
            for (j = 1; j <= n; j++)
                if (ma[i][j])
                    ok = 0;
            if (ok)
                cout << i << ", ";
        }
        if (ok == 0)
            cout << "Nu exista";
        cout << "\n";

        cout << "b) ";
        for (i = 1; i <= n; i++)
            if (ma[1][i])
                gradmax++;
        ok = 1;
        for (i = 1; i <= n; i++) {
            grad = 0;
            for (j = 1; j <= n; j++)
                if (ma[i][j])
                    grad++;
            if (grad != gradmax)
                ok = 0;
        }
        if (ok == 1)
            cout << "Da\n";
        else cout << "Nu\n";

        //Matricea distantelor folosind Roy-Floyd

        cout << "c)" << "\n";

        for (i = 1; i <= n; i++)
            for (j = 1; j <= n; j++)
                if (ma[i][j] == 0)
                    d[i][j] = INT_MAX;
                else
                    d[i][j] = ma[i][j];

        for (int k = 1; k <= n; k++)
            for (i = 1; i <= n; i++)
                for (j = 1; j <= n; j++) {
                    if (d[i][k] == INT_MAX || d[k][j] == INT_MAX)
                        continue;
                    if (d[i][j] > d[i][k] + d[k][j])
                        d[i][j] = d[i][k] + d[k][j];
                    }

        for(i = 1; i <= n; i++)
            d[i][i] = 0;

        for(i = 1; i <= n; i++) {
            for (j = 1; j <= n; j++)
                if (d[i][j] == INT_MAX)
                    cout << "inf" << " ";
                else
                    cout << d[i][j] << " ";
            cout << "\n";
        }

        cout << "d) ";

        ok = 1;
        for(i = 1; i <= n; i++)
            for(j = 1; j <= n; j++)
                if(d[i][j] == INT_MAX)
                    ok = 0;

        if(ok)
            cout << "Da";
        else
            cout << "Nu";
    }

    else if(mod == 3){
        fin >> n;
        while(fin.getline(line, 256)) {
            char *nod = strtok(line, " ");
            ok = 0;
            while (nod != nullptr) {
                if(ok == 0) {
                    x = nod[0] - '0';
                    ok = 1;
                }
                else {
                    y = nod[0] - '0';
                    ok = 2;
                }
                if(ok == 2)
                    ma[x][y] = ma[y][x] = 1;
                nod = strtok(nullptr, "");
            }
        }

        cout << "a) ";
        for (i = 1; i <= n; i++) {
            ok = 1;
            for (j = 1; j <= n; j++)
                if (ma[i][j])
                    ok = 0;
            if (ok)
                cout << i << ", ";
            }
        if (ok == 0)
            cout << "Nu exista";
        cout << "\n";

        cout << "b) ";
        for (i = 1; i <= n; i++)
            if (ma[1][i])
                gradmax++;

        ok = 1;
        for (i = 1; i <= n; i++) {
            grad = 0;
            for (j = 1; j <= n; j++)
                if (ma[i][j])
                    grad++;
            if (grad != gradmax)
                ok = 0;
        }
            if (ok == 1)
                cout << "Da\n";
            else cout << "Nu\n";

    }

    else if (mod == 4){
        fin >> n >> m;
        for(i = 1; i <= n; i++)
            for(j = 1; j <= m; j++)
                fin >> mi[i][j];


        for(j = 1; j <= m; j++) {
            x = y = 0;
            for (i = 1; i <= n; i++)
                if (mi[i][j] == 1 && x != 0)
                    ma[x][i] = ma[i][x] = 1;
                else
                    x = i;
        }

        cout << "a) ";
        for (i = 1; i <= n; i++) {
            ok = 1;
            for (j = 1; j <= n; j++)
                if (ma[i][j])
                    ok = 0;
            if (ok)
                cout << i << ", ";
        }
        if (ok == 0)
            cout << "Nu exista";
        cout << "\n";

        cout << "b) ";
        for (i = 1; i <= n; i++)
            if (ma[1][i])
                gradmax++;

        ok = 1;
        for (i = 1; i <= n; i++) {
            grad = 0;
            for (j = 1; j <= n; j++)
                if (ma[i][j])
                    grad++;
            if (grad != gradmax)
                ok = 0;
        }
        if (ok == 1)
            cout << "Da\n";
        else cout << "Nu\n";


    }
}

int main(){
    // Alegem numarul problemei din cele doua din cerinta de laborator pe care vrem sa o testam

    int numar;
    cout << "Alegeti problema: ";
    cin >> numar;
    if(numar == 1)
        problema1();
    else
        problema2();
}
