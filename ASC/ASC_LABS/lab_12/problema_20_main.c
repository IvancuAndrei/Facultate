#include <stdio.h>
#include <stdlib.h>

int dublare(int n);

int main(){
    int v[10] = {0}, v2[10] = {0};
    int i = 0, nr, j;
    FILE *pFile = fopen("numere.txt","r");
    
    while(fscanf(pFile, "%d ", &nr) != EOF)
    {   
        v[i] = dublare(nr);   
        i ++;
    }
    
    for (j = 0; j < i; j++)
        v2[i - j - 1] = v[j];
    
    for (j = 0; j < i; j++)
        printf("%d ", v2[j]);
    return 0;
       
}