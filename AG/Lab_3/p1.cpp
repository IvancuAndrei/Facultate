#include <iostream>
#include <fstream>

using namespace std;

typedef struct muchie
{
    int src;
    int dest;
    int wt;
}muchie;


void citire(char in[], muchie x[], int &V, int &E, int &S){

    ifstream f(in);
    f>>V>>E>>S;

    for(int i=0;i<E;i++){
        f>>x[i].src>>x[i].dest>>x[i].wt;
    }

    f.close();
}
void bellman_ford(char out[],int nv,muchie e[],int src_graph,int ne)
{
    ofstream g(out);
    int u,v,weight,i,j;
    int dis[100000];

    for(i=0;i<nv;i++)
    {
        dis[i]=999;
    }

    dis[src_graph]=0;

    /* 'relaxam' muchiile nv - 1 ori */
    for(i=0;i<nv-1;i++)
    {
        for(j=0;j<ne;j++){
            u=e[j].src;
            v=e[j].dest;
            weight=e[j].wt;

            if(dis[u]!=999 && dis[u]+weight < dis[v]){
                dis[v]=dis[u]+weight;
            }
        }

    }

    /* verificam ciclu negativ */
    for(j=0;j<ne;j++)
    {
        u=e[j].src;
        v=e[j].dest;
        weight=e[j].wt;

        if(dis[u]+weight < dis[v]){
            g<<"\nCICLU NEGATIV!!\n";
            return;
        }
    }

    g<<"\nNOD "<<"  DISTANTA DE LA SURSA";
    for(i=0;i<nv;i++)
    {
        g<<"\n"<<i<<"\t"<<dis[i];
    }
    g<<"\n";

    g.close();
}

int main(int argc, char* argv[]){

    int V,E,S;
    muchie x[100600];
    citire(argv[1], x, V, E, S);
    bellman_ford(argv[2],V,x,S,E);

}