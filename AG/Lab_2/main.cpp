#include <iostream>
#include <fstream>
#include <vector>
#include <queue>

using namespace std;

ifstream f("graf.txt");

const int NMAX = 105; // numarul maxim de noduri
const int MAX = 109;

int n;
vector<int> graf[NMAX];

void read() {
    f >> n;
    int i, j;
    while (f >> i >> j)
        graf[i].push_back(j);
}

int pred[NMAX];
int dist[NMAX];
bool viz[NMAX];
queue<int> q;
void bfs_moore(int start) {
    for (int i = 1; i <= n; i++)
        dist[i] = MAX;

    q.push(start);
    viz[start] = 1;
    dist[start] = 0;
    pred[start] = 0;
    while (!q.empty()) {
        int nod = q.front();
        q.pop();
        for (int vecin : graf[nod]) {
            if (viz[vecin] == 0) {
                viz[vecin] = 1;
                dist[vecin] = dist[nod] + 1;
                pred[vecin] = nod;
                q.push(vecin);
            }
        }
    }
}

void retrive(int nod) {
    if (nod == 0)
        return;
    else
        retrive(pred[nod]);
    cout << nod << ' ';
}

void moore() {
    cout << "Nodul de start: ";
    int start;
    cin >> start;

    cout << "Nodul de sfarsit: ";
    int end;
    cin >> end;

    bfs_moore(start);
    retrive(end);
}

int main() {

    read();
    moore();

    return 0;
}