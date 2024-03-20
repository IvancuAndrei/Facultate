#include <stdio.h>
#include <float.h>


int putere2 (int n){
    int p = 0;
    while(n % 2 == 0) {
        p++;
        n = n / 2;
    }
    return p;
}

int putere5 (int n){
    int p = 0;
    while (n % 5 == 0) {
        n = n / 5;
        p++;
    }
        return p;
}

void problema1(){
    printf("Introduceti numerele: ");
    int n, p2 = 0, p5 = 0;
    scanf("%d", &n);
    if (n != 0)
        while (n != 0) {
            p2 += putere2(n);
            p5 += putere5(n);
            scanf("%d", &n);
        }
    if (p2 < p5)
        printf("%d\n", p2);
    else
        printf("%d\n", p5);

}

void problema2(){
    float x1, y1, x2, y2, x3, y3, x4, y4, x, y;
    float m1, n1, m2, n2, min1, max1, min2, max2;

    printf("Introduceti coordonatele primului segment:\n");
    printf("x1= "); scanf("%f", &x1);
    printf("y1= "); scanf("%f", &y1);
    printf("x2= "); scanf("%f", &x2);
    printf("y2= "); scanf("%f", &y2);
    printf("\nIntroduceti coordonatele celui de-al doilea segment:\n");
    printf("x3= "); scanf("%f", &x3);
    printf("y3= "); scanf("%f", &y3);
    printf("x4= "); scanf("%f", &x4);
    printf("y4= "); scanf("%f", &y4);

    m1 = (y2 - y1) / (x2 - x1);
    m2 = (y4 - y3) / (x4 - x3);

    if (m1 != m2)
    {
        n1 = y1 - m1 * x1;
        n2 = y3 - m2 * x3;

        x = (n2 - n1) / (m1 - m2);
        y = m1 * x + n1;

        min1=max1=x1;
        min2=max2=x2;
        if(x2 > max1)
            max1= x2;
        if(x3 > max1)
            max1= x3;
        if(x4 > max1)
            max1= x4;

        if(x2 < min1)
            min1= x2;
        if(x3 < min1)
            min1= x3;
        if(x4 < min1)
            min1= x4;

        if(y2 > max2)
            max2= y2;
        if(y3 > max2)
            max2= y3;
        if(y4 > max2)
            max2= y4;

        if(y2 < min2)
            min2= y2;
        if(y3 < min2)
            min2= y3;
        if(y4 < min2)
            min2= y4;

        if (x >= min1 && x <= max2 && y >= min2 && y <= max2)
        {
            printf("Coordonatele punctului de intersectie sunt:\n");
            printf("x = %.2f, y = %.2f", x, y);
        }
        else
        {
            printf("Segmentele nu se intersecteaza.\n");
        }
    }
    else
    {
        printf("Segmentele sunt paralele.\n");
    }
        }

int main() {

    int optiune = 1;
    while(optiune) {
        printf("0 - Iesire   1 - Numarul de cifre 0   2 - Intersectia a doua segmente\n ");
        printf("Alegeti optiunea:");
        scanf("%d", &optiune);

        if (optiune == 1)
            problema1();
        else if (optiune == 2)
            problema2();
    }
}