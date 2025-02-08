#include <bits/stdc++.h>
#include "probleme.h"
using namespace std;

void problema_1(int r){
    cout << 2 * M_PI * r  << "\n";
    cout << M_PI * r * r << "\n";
}

void problema_2(int a, int b){
    int r;
    while ( b != 0 ) {
        r = a % b;
        a = b;
        b = r;
    }
    cout << a << endl;
}

void problema_3(int n){
    int s, x, i;
    s = 0;
    for ( i = 1; i <= n; i++) {
        cin >> x;
        s = s + x;
    }
    cout << s << endl;

}

void problema_gresita(char c, int a){
    int s, v[1000] = {0};
    s = 0;
    while (a != 0) {
        s = s + 1;
        v[a] = s;
        a--;
    }
    cout << c << " " << v[1];
}



