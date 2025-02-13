#include <iostream>
#include <fstream>
#include <chrono>
#include <string>
#include "mpi.h"

using namespace std;

void writeResultToFile(string fileName, int result[], int size) {
    ofstream out(fileName);
    out << size << '\n';
    for (int i = size - 1; i >= 0; i--) {
        out << result[i] << ' ';
    }
    out.close();
}

bool checkCorrectness(string fileName, int result[], int size) {
    ifstream in(fileName);
    int digitNum;
    int expected[100001];

    in >> digitNum;
    for (int i = 0; i < digitNum; i++) {
        in >> expected[i];
    }
    in.close();

    if (digitNum != size) {
        cout << "Expected Size: " << digitNum << ", Got Size: " << size << '\n';
        return false;
    }

    for (int i = 0; i < size; i++) {
        if (expected[i] != result[size - i - 1]) {
            cout << "Mismatch at index " << i << ": Expected " << expected[i] << ", Got " << result[size - i - 1] << '\n';
            return false;
        }
    }
    return true;
}

int main(int argc, char* argv[]) {
    int myRank, worldSize;
    MPI_Status status;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &worldSize);
    MPI_Comm_rank(MPI_COMM_WORLD, &myRank);

    const int nr1 = 100, nr2 = 100000;
    int maxLen = max(nr1, nr2);
    int resultSize = maxLen;

    while (resultSize % worldSize != 0) {
        resultSize++;
    }

    int* num1 = new int[resultSize]();
    int* num2 = new int[resultSize]();
    int* result = new int[resultSize + 1]();

    if (myRank == 0) {
        ifstream in1("D:\\Facultate - Github\\Facultate\\PPD\\LAB 3\\LAB 3\\Inputs\\Numar1_1.txt");
        ifstream in2("D:\\Facultate - Github\\Facultate\\PPD\\LAB 3\\LAB 3\\Inputs\\Numar2_1.txt");

        int aux;
        in1 >> aux;
        in2 >> aux;

        for (int i = 0; i < nr1; i++) {
            in1 >> num1[i];
        }

        for (int i = 0; i < nr2; i++) {
            in2 >> num2[i];
        }

    }

    int* displacements = new int[worldSize];
    int* offsets = new int[worldSize];

    const int whole = resultSize / worldSize;
    int remainder = resultSize % worldSize;
    int start = 0, end = whole;
    int maximumOffset = whole;
    if (remainder > 0) {
        maximumOffset++;
    }

    for (int processIndex = 0; processIndex < worldSize; processIndex++) {
        if (remainder > 0) {
            end++;
            remainder--;
        }

        displacements[processIndex] = start;
        offsets[processIndex] = end - start;

        start = end;
        end = start + whole;
    }

    int* auxNum1 = new int[maximumOffset];
    int* auxNum2 = new int[maximumOffset];
    int* auxResult = new int[maximumOffset];

    auto startTime = chrono::high_resolution_clock::now();

    MPI_Scatterv(num1, offsets, displacements, MPI_INT, auxNum1, maximumOffset, MPI_INT, 0, MPI_COMM_WORLD);
    MPI_Scatterv(num2, offsets, displacements, MPI_INT, auxNum2, maximumOffset, MPI_INT, 0, MPI_COMM_WORLD);

    int carry = 0;
    for (int i = 0; i < offsets[myRank]; i++) {
        int sum = auxNum1[i] + auxNum2[i] + carry;
        auxResult[i] = sum % 10;
        carry = sum / 10;
    }

    if (myRank < worldSize - 1) {
        MPI_Send(&carry, 1, MPI_INT, myRank + 1, 0, MPI_COMM_WORLD);
    }
    else {
        MPI_Send(&carry, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }

    if (myRank != 0) {
        MPI_Recv(&carry, 1, MPI_INT, myRank - 1, 0, MPI_COMM_WORLD, &status);
        for (int i = 0; i < offsets[myRank]; i++) {
            int sum = auxResult[i] + carry;
            auxResult[i] = sum % 10;
            carry = sum / 10;
        }
    }
    else {
        MPI_Recv(&carry, 1, MPI_INT, worldSize - 1, 0, MPI_COMM_WORLD, &status);
        if (carry == 1) {
            result[maxLen] = 1;
            maxLen++;
        }
    }

    MPI_Gatherv(auxResult, offsets[myRank], MPI_INT, result, offsets, displacements, MPI_INT, 0, MPI_COMM_WORLD);

    if (myRank == 0) {
        int finalSize = maxLen;
        while (finalSize > 1 && result[finalSize - 1] == 0) {
            finalSize--;
        }

        auto endTime = chrono::high_resolution_clock::now();

        reverse(result, result + finalSize);

        if (checkCorrectness("D:\\Facultate - Github\\Facultate\\PPD\\LAB 3\\LAB 3\\Outputs\\Expected_1.txt", result, finalSize)) {
            writeResultToFile("D:\\Facultate - Github\\Facultate\\PPD\\LAB 3\\LAB 3\\Outputs\\Numar3_1.txt", result, finalSize);
            cout << "Execution time: " << chrono::duration<double, milli>(endTime - startTime).count() << " ms" << endl;
        }
        else {
            cout << "INCORRECT RESULT!" << endl;
        }
    }

    delete[] num1;
    delete[] num2;
    delete[] result;
    delete[] displacements;
    delete[] offsets;
    delete[] auxNum1;
    delete[] auxNum2;
    delete[] auxResult;

    MPI_Finalize();
    return 0;
}
