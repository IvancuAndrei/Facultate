#include <iostream>
#include <fstream>
#include <cmath>
#include <cstring>
#include <Windows.h>
using namespace std;

int n = 400;  // Dimensiunea imaginii
int unit = 20; // Unitatea de măsură în pixeli

int centerX = n / 2;
int centerY = n / 2;

// Funcție pentru scrierea header-ului BMP
void writeHeader(ostream& out, int width, int height) {
    if (width % 4 != 0) {
        cerr << "ERROR: There is a windows-imposed requirement on BMP that the width be a multiple of 4.\n";
        exit(1);
    }

    BITMAPFILEHEADER tWBFH;
    tWBFH.bfType = 0x4d42;
    tWBFH.bfSize = 14 + 40 + (width * height * 3) + (height * (width % 4));  // include padding
    tWBFH.bfReserved1 = 0;
    tWBFH.bfReserved2 = 0;
    tWBFH.bfOffBits = 14 + 40;

    BITMAPINFOHEADER tW2BH;
    memset(&tW2BH, 0, 40);
    tW2BH.biSize = 40;
    tW2BH.biWidth = width;
    tW2BH.biHeight = height;
    tW2BH.biPlanes = 1;
    tW2BH.biBitCount = 24;
    tW2BH.biCompression = 0;

    out.write((char*)(&tWBFH), 14);
    out.write((char*)(&tW2BH), 40);
}

void drawPixel(ofstream& ofs, int r, int g, int b) {
    ofs << (unsigned char) b;
    ofs << (unsigned char) g;
    ofs << (unsigned char) r;
}


// Functia pentru a desena axele
void drawAxes(string filename){
    ofstream ofs;
    ofs.open(filename + ".bmp");
    writeHeader(ofs, n, n);


    for (int y = 0; y < n; y++)
        for (int x = 0; x < n; x++)
            if (x == centerX || y == centerY) // axa Y
                drawPixel(ofs, 0, 0, 0);
            else
                drawPixel(ofs, 255, 255, 255);

}

// Functia pentru a desena linia
void drawLine(string filename) {
    ofstream ofs;
    ofs.open(filename + ".bmp");
    writeHeader(ofs, n, n);

    int x1 = -2 * unit + centerX, y1 = 3 * unit + centerY;
    int x2 = 2 * unit + centerX, y2 = 5 * unit + centerY;

    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            if (abs((i - y1) * (x2 - x1) - (j - x1) * (y2 - y1)) <= 1)
                drawPixel(ofs, 0, 0, 0);
            else
                drawPixel(ofs, 255, 255, 255);
}


// Functia pentru a desena cercul
void drawCircle(string fileName) {
    ofstream ofs;
    ofs.open(fileName + ".bmp");
    writeHeader(ofs, n, n);


    // Cercul cu centrul in O(3, -4) si raza 2.5
    int x = 3 * unit + centerX, y = -4 * unit + centerY;
    double radius = 2.5 * unit;

    // Desenarea cercului
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            if (abs((j - x) * (j - x) + (i - y) * (i - y) - radius * radius) <= 3)
                drawPixel(ofs, 0, 0, 0);
            else
                drawPixel(ofs, 255, 255, 255);
}

int main() {
    drawAxes("axe");
    drawLine("line");
    drawCircle("cerc");

    return 0;
}
