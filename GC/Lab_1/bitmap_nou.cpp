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

// Functia pentru a desena axele
void drawAxes(string filename){
    ofstream ofs;
    ofs.open(filename + ".bmp");
    writeHeader(ofs, n, n);



    for (int y = 0; y < n; y++) {
        for (int x = 0; x < n; x++) {
            if (x == centerX) { // axa Y
                ofs << (unsigned char)0;
                ofs << (unsigned char)0;
                ofs << (unsigned char)0;
            } else if (y == centerY) { // axa X
                ofs << (unsigned char)0;
                ofs << (unsigned char)0;
                ofs << (unsigned char)0;
            } else {
                ofs << (unsigned char)255;
                ofs << (unsigned char)255;
                ofs << (unsigned char)255;
            }
        }

    }
}

// Functia pentru a desena linia
void drawLine(string filename) {
    ofstream ofs;
    ofs.open(filename + ".bmp");
    writeHeader(ofs, n, n);

    int x1 = -2 * unit, y1 = 3 * unit;
    int x2 = 2 * unit, y2 = 5 * unit;

    int dx = abs(x2 - x1);
    int dy = abs(y2 - y1);
    int sx = (x1 < x2) ? 1 : -1;
    int sy = (y1 < y2) ? 1 : -1;
    int err = dx - dy;

    while (true) {
        if (x1 >= 0 && x1 < n && y1 >= 0 && y1 < n) {
            ofs << (unsigned char)0;
            ofs << (unsigned char)0;
            ofs << (unsigned char)0;
        }

        if (x1 == x2 && y1 == y2)
            break;

        int e2 = err * 2;
        if (e2 > -dy) {
            err -= dy;
            x1 += sx;
        }
        if (e2 < dx) {
            err += dx;
            y1 += sy;
        }
    }
}


// Functia pentru a desena cercul
void drawCoordinateSystem(string fileName) {
    ofstream ofs;
    ofs.open(fileName + ".bmp");
    writeHeader(ofs, n, n);



    // Cercul cu centrul in O(3, -4) si raza 2.5
    int cx = 3 * unit + centerX, cy = -4 * unit + centerY;
    double radius = 2.5 * unit;

    // Desenarea cercului
    for (int x = 0; x < n; x++) {
        for (int y = 0; y < n; y++) {
            double distance = sqrt(pow(x - cx, 2) + pow(y - cy, 2));
            if (abs(distance - radius) < unit) {
                ofs << (unsigned char)255;
                ofs << (unsigned char)255;
                ofs << (unsigned char)255;  // Cercul alb
            } else {
                ofs << (unsigned char)255;
                ofs << (unsigned char)255;
                ofs << (unsigned char)255;
            }
        }

    }
}

int main() {
    drawAxes("axe");
    drawLine("line");
    drawCoordinateSystem("cerc");

    return 0;
}
