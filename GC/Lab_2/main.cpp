#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <random>
using namespace std;

// Dimensiunile imaginii și adâncimea de culoare (RGB)
int CANVAS_WIDTH = 1000, CANVAS_HEIGHT = 1000, COLOR_DEPTH = 3;

// Structură pentru coordonate 2D (folosită pentru proiecție pe ecran)
struct Coord2D {
    float u, v;
};

// Structură pentru coordonate 3D (folosită pentru poziția camerei și direcții)
struct Coord3D {
    float u, v, w;
};

// Structură pentru coordonate 4D (folosită pentru transformări omogene)
struct Coord4D {
    float u, v, w, t;
};

// Structură pentru matricea de transformare 4x4
struct Transform4x4 {
    float grid[4][4];
};

// Aplică o transformare (matrice 4x4) asupra unui punct 4D
Coord4D applyTransform(const Transform4x4& transform, const Coord4D& point) {
    return {
        transform.grid[0][0] * point.u + transform.grid[0][1] * point.v + transform.grid[0][2] * point.w + transform.grid[0][3] * point.t,
        transform.grid[1][0] * point.u + transform.grid[1][1] * point.v + transform.grid[1][2] * point.w + transform.grid[1][3] * point.t,
        transform.grid[2][0] * point.u + transform.grid[2][1] * point.v + transform.grid[2][2] * point.w + transform.grid[2][3] * point.t,
        transform.grid[3][0] * point.u + transform.grid[3][1] * point.v + transform.grid[3][2] * point.w + transform.grid[3][3] * point.t
    };
}

// Creează o matrice de translație cu deplasări dx, dy, dz
Transform4x4 shiftTransform(float dx, float dy, float dz) {
    return {{
        {1, 0, 0, dx}, // Linia 1: translație pe x
        {0, 1, 0, dy}, // Linia 2: translație pe y
        {0, 0, 1, dz}, // Linia 3: translație pe z
        {0, 0, 0, 1}   // Linia 4: păstrează coordonata omogenă
    }};
}

// Creează o matrice de scalare cu factorii sx, sy, sz
Transform4x4 resizeTransform(float sx, float sy, float sz) {
    return {{
        {sx, 0, 0, 0}, // Linia 1: scalare pe x
        {0, sy, 0, 0}, // Linia 2: scalare pe y
        {0, 0, sz, 0}, // Linia 3: scalare pe z
        {0, 0, 0, 1}   // Linia 4: păstrează coordonata omogenă
    }};
}

// Creează o matrice de rotație combinată pe axele X, Y, Z (în grade)
Transform4x4 spinTransform(float degX, float degY, float degZ) {

    // Conversie grade în radiani pentru X, Y si Z
    float radX = degX * M_PI / 180.0;
    float radY = degY * M_PI / 180.0;
    float radZ = degZ * M_PI / 180.0;

    // Valori trigonometrice pentru X, Y si Z
    float cosX = cos(radX), sinX = sin(radX);
    float cosY = cos(radY), sinY = sin(radY);
    float cosZ = cos(radZ), sinZ = sin(radZ);

    return {{
        {cosY * cosZ, -cosY * sinZ, sinY, 0},
        {sinX * sinY * cosZ + cosX * sinZ, -sinX * sinY * sinZ + cosX * cosZ, -sinX * cosY, 0},
        {-cosX * sinY * cosZ + sinX * sinZ, cosX * sinY * sinZ + sinX * cosZ, cosX * cosY, 0},
        {0, 0, 0, 1}
    }};
}

// Creează o matrice de rotație doar pe axa Y (în grade)
Transform4x4 spinYTransform(float deg) {
    float radians = deg * M_PI / 180.0; // Conversie grade în radiani
    float c = cos(radians), s = sin(radians);

    return {{
        {c, 0, s, 0},  // Linia 1: rotație pe XZ
        {0, 1, 0, 0},  // Linia 2: Y neschimbat
        {-s, 0, c, 0}, // Linia 3: rotație pe XZ
        {0, 0, 0, 1}   // Linia 4: păstrează coordonata omogenă
    }};
}

// Înmulțește două matrici 4x4
Transform4x4 combineTransforms(const Transform4x4& t1, const Transform4x4& t2) {
    Transform4x4 result = {{{0}}}; // Inițializează matricea rezultat cu zerouri
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < 4; j++)
            for (int k = 0; k < 4; k++)
                result.grid[i][j] += t1.grid[i][k] * t2.grid[k][j]; // Calcul produs matricial
    return result;
}

// Creează o matrice de vizualizare bazată pe poziția camerei, țintă și direcția „sus”
Transform4x4 cameraView(Coord3D camPos, Coord3D focus, Coord3D upDir) {
    Coord3D forward = {focus.u - camPos.u, focus.v - camPos.v, focus.w - camPos.w}; // Vectorul „înainte”
    float mag = sqrt(forward.u * forward.u + forward.v * forward.v + forward.w * forward.w); // Magnitudine
    forward.u /= mag; forward.v /= mag; forward.w /= mag; // Normalizare

    Coord3D right = {upDir.v * forward.w - upDir.w * forward.v, // Vectorul „dreapta” (produs vectorial)
                     upDir.w * forward.u - upDir.u * forward.w,
                     upDir.u * forward.v - upDir.v * forward.u};
    mag = sqrt(right.u * right.u + right.v * right.v + right.w * right.w); // Magnitudine
    right.u /= mag; right.v /= mag; right.w /= mag; // Normalizare

    Coord3D upward = {forward.v * right.w - forward.w * right.v, // Vectorul „sus” (produs vectorial)
                      forward.w * right.u - forward.u * right.w,
                      forward.u * right.v - forward.v * right.u};

    return {{
        {right.u, right.v, right.w, -right.u * camPos.u - right.v * camPos.v - right.w * camPos.w},
        {upward.u, upward.v, upward.w, -upward.u * camPos.u - upward.v * camPos.v - upward.w * camPos.w},
        {forward.u, forward.v, forward.w, -forward.u * camPos.u - forward.v * camPos.v - forward.w * camPos.w},
        {0, 0, 0, 1}
    }};
}

// Desenează o linie pe canvas folosind algoritmul Bresenham
void traceLine(vector<unsigned char>& canvas, Coord2D start, Coord2D end, unsigned char red, unsigned char green, unsigned char blue) {
    int xStart = (int)start.u, yStart = (int)start.v, xEnd = (int)end.u, yEnd = (int)end.v; // Convertire la int
    int deltaX = abs(xEnd - xStart), stepX = xStart < xEnd ? 1 : -1; // Diferența și direcția pe X
    int deltaY = -abs(yEnd - yStart), stepY = yStart < yEnd ? 1 : -1; // Diferența și direcția pe Y
    int error = deltaX + deltaY, error2; // Eroare inițială

    while (true) {
        int pixelPos = (yStart * CANVAS_WIDTH + xStart) * COLOR_DEPTH; // Poziția pixelului în canvas
        if (pixelPos >= 0 && pixelPos < CANVAS_WIDTH * CANVAS_HEIGHT * COLOR_DEPTH) { // Verificare limite
            canvas[pixelPos] = red; canvas[pixelPos + 1] = green; canvas[pixelPos + 2] = blue; // Setare culoare
        }
        if (xStart == xEnd && yStart == yEnd) break; // Oprire la final
        error2 = 2 * error; // Calcul eroare dublată
        if (error2 >= deltaY) { error += deltaY; xStart += stepX; } // Ajustare X
        if (error2 <= deltaX) { error += deltaX; yStart += stepY; } // Ajustare Y
    }
}


void exportCanvas(const vector<unsigned char>& canvas, const string& fileName) {
    ofstream output(fileName, ios::binary);
    if (!output) {
        cerr << "Error saving the canvas!" << endl;
        return;
    }

    int paddedRow = (CANVAS_WIDTH * COLOR_DEPTH + 3) & (~3); // Lățimea rândului aliniată la 4 octeți
    int totalSize = 54 + paddedRow * CANVAS_HEIGHT; // Dimensiunea totală a fișierului

    unsigned char bmpHeader[54] = {0};
    bmpHeader[0] = 'B'; bmpHeader[1] = 'M';
    *(int32_t*)&bmpHeader[2] = totalSize;
    bmpHeader[10] = 54; bmpHeader[14] = 40;
    *(int32_t*)&bmpHeader[18] = CANVAS_WIDTH;
    *(int32_t*)&bmpHeader[22] = CANVAS_HEIGHT;
    bmpHeader[26] = 1; bmpHeader[28] = COLOR_DEPTH * 8;
    *(int32_t*)&bmpHeader[34] = totalSize - 54;

    output.write((char*)bmpHeader, 54);

    vector<unsigned char> rowData(paddedRow, 0);
    for (int y = 0; y < CANVAS_HEIGHT; y++) {
        for (int x = 0; x < CANVAS_WIDTH * COLOR_DEPTH; x++)
            rowData[x] = canvas[((CANVAS_HEIGHT - y - 1) * CANVAS_WIDTH * COLOR_DEPTH) + x]; // Copiază datele (inversare Y)
        output.write((char*)rowData.data(), paddedRow);
    }
    output.close();
}

int main() {
    // Definirea vârfurilor cubului în coordonate 4D
    vector<Coord4D> shape = {
        {0, 0, 0, 1}, {1, 0, 0, 1}, {1, 1, 0, 1}, {0, 1, 0, 1},
        {0, 0, 1, 1}, {1, 0, 1, 1}, {1, 1, 1, 1}, {0, 1, 1, 1}
    };

    // Matrici de transformare
    Transform4x4 move = shiftTransform(40, 40, -40); // Translație
    Transform4x4 size = resizeTransform(20, 20, 20); // Scalare
    Transform4x4 turn = spinYTransform(45); // Rotație pe axa Y

    // Configurare cameră
    Coord3D camOrigin = {-50, 50, -50}; // Poziția camerei
    Coord3D camFocus = {0, 0, 0}; // Punctul spre care privește camera
    Coord3D camUp = {0, 1, 0}; // Direcția „sus”
    Transform4x4 camMatrix = cameraView(camOrigin, camFocus, camUp); // Matricea de vizualizare

    vector<Coord2D> screenCoords; // Coordonate proiectate pe ecran
    vector<unsigned char> canvas(CANVAS_WIDTH * CANVAS_HEIGHT * COLOR_DEPTH, 255); // Canvas inițial alb

    // Transformă și proiectează fiecare vârf al cubului
    for (auto pt : shape) {
        Coord4D transformed = applyTransform(turn, pt); // Aplică rotația
        transformed = applyTransform(move, transformed); // Aplică translația
        transformed = applyTransform(size, transformed); // Aplică scalarea
        transformed = applyTransform(camMatrix, transformed); // Aplică vizualizarea

        cout << transformed.u << " " << transformed.v << " " << transformed.w << "\n"; // Afișează coordonatele
        screenCoords.push_back({transformed.u, transformed.v}); // Proiecție 2D
    }


    std::random_device randSrc;
    std::mt19937 randEngine(randSrc());
    std::uniform_int_distribution<int> colorRange(0, 255);

    // Desenează liniile cubului cu culori aleatorii
    traceLine(canvas, screenCoords[0], screenCoords[1], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));
    traceLine(canvas, screenCoords[1], screenCoords[2], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));
    traceLine(canvas, screenCoords[2], screenCoords[3], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));
    traceLine(canvas, screenCoords[3], screenCoords[0], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));
    traceLine(canvas, screenCoords[4], screenCoords[5], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));
    traceLine(canvas, screenCoords[5], screenCoords[6], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));
    traceLine(canvas, screenCoords[6], screenCoords[7], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));
    traceLine(canvas, screenCoords[7], screenCoords[4], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));
    traceLine(canvas, screenCoords[0], screenCoords[4], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));
    traceLine(canvas, screenCoords[1], screenCoords[5], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));
    traceLine(canvas, screenCoords[2], screenCoords[6], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));
    traceLine(canvas, screenCoords[3], screenCoords[7], colorRange(randEngine), colorRange(randEngine), colorRange(randEngine));

    exportCanvas(canvas, "shape_output.bmp");
    return 0;
}