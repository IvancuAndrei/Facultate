#include <mpi.h>
#include <stdio.h>
#include <string.h>
#include <iostream>
using namespace std;
const int N = 10;

void print(int* a, int n)
{
	for (int i = 0; i < n; i++) {
		cout << a[i] << " ";
	}
	cout << endl;
}

int main(int argc, char** argv) {
	int id, nrprocs;
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &nrprocs);
	MPI_Comm_rank(MPI_COMM_WORLD, &id);

	int a[N];
	int b[N];
	int c[N];
	int sizeChunk = N / nrprocs;
	int remainder = N % nrprocs;
	if (id == 0) {
		for (int i = 0; i < N; i++) {
			a[i] = rand() % 10;
			b[i] = rand() % 10;
		}
	}
	int* sendCounts = new int[nrprocs];
	int* displ = new int[nrprocs];
	int offset = 0;

	for (int i = 0; i < nrprocs; i++)
	{
		if (i < remainder) {
			sendCounts[i] = sizeChunk + 1;
		}
		else {
			sendCounts[i] = sizeChunk;
		}
		displ[i] = offset;
		offset += sendCounts[i];
	}

	int recvSize = sendCounts[id];

	int* auxA = new int[sizeChunk];
	int* auxB = new int[sizeChunk];
	int* auxC = new int[sizeChunk];

	MPI_Scatterv(a, sendCounts, displ, MPI_INT, auxA, recvSize, MPI_INT, 0, MPI_COMM_WORLD);
	MPI_Scatterv(b, sendCounts, displ, MPI_INT, auxB, recvSize, MPI_INT, 0, MPI_COMM_WORLD);

	for (int i = 0; i < recvSize; i++) {
		auxC[i] = auxA[i] + auxB[i];
	}
	MPI_Gatherv(auxC, recvSize, MPI_INT, c, sendCounts, displ, MPI_INT, 0, MPI_COMM_WORLD);
	if (id == 0) {
		print(a, N);
		print(b, N);
		print(c, N);
	}

	MPI_Finalize();
	return 0;
}