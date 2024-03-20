#include <bits/stdc++.h>
using namespace std;

ifstream fin("input.txt");
ofstream fout("output.txt");

vector<vector<int>> G; // G[x] numerele de ordine ale muchiilor incidente nodului x
vector<pair<int, int>> edges; // lista de muchii
vector<bool> used; // used[i] muchia cu indicele i a fost folosita
vector<int> cycle; // ciclul eulerian
stack<int> st;



void euler(int start) {
    st.push(start);

    while (!st.empty()) { // simulez recursivitatea cu o stiva
        int node = st.top();

        if (!G[node].empty()) { // daca node mai are vecini
            int edge_index = G[node].back(); // extrag o muchie incidenta lui node
            G[node].pop_back(); // elimin muchia 

            if (!used[edge_index]) { // daca nu am sters muchia (graful e neorientat deci o pot gasi iar in lista de incidenta a altui nod)
                used[edge_index] = true;
                int neighbour = edges[edge_index].second; // extrag vecinul lui node

                if (node == neighbour) {
                    neighbour = edges[edge_index].first;
                }

                st.push(neighbour); // apel recursiv
            }
        }
        else { // intoarcere din recursivitate
            cycle.push_back(node);
            st.pop();
        }
    }
    cycle.pop_back();
}

int main(){

    int n;
    int m;
    fin >> n >> m;

    used.resize(m, false);
    G.resize(n, vector<int>());
    edges.reserve(m);

    int u, v;
    while (fin >> u >> v) {
        edges.emplace_back(u, v);
        int index = edges.size() - 1;
        G[u].push_back(index);
        G[v].push_back(index);
    }

    euler(0);

    for (int node : cycle)
        fout << node << ' ';

    fin.close();
    fout.close();
    return 0;
}