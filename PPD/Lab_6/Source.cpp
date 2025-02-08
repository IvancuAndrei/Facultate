#include <mpi.h>
#include <stdio.h>
#include <string.h>
#include <iostream>

using namespace std;
#define MAX_SIZE 100
#define MAX_PROCESSES 10

int hello(const int argc, char** argv) {
	int id, nrprocs;
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &nrprocs);
	MPI_Comm_rank(MPI_COMM_WORLD, &id);

	char message[MAX_SIZE];
	snprintf(message, MAX_SIZE, "Hello from process %d", id);
	if (id != 0) {
		MPI_Send(message, strlen(message) + 1, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
	}
	else {
		char final_message[MAX_SIZE * MAX_PROCESSES];
		strcpy_s(final_message, message);
		for (int i = 1; i < nrprocs; i++) {
			MPI_Recv(final_message + strlen(final_message), MAX_SIZE, MPI_CHAR, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		}
		cout << "Process [0] message: \n" << final_message << "\n";
	}
	MPI_Finalize();
	return 0;
}


int main(int argc, char** argv) {
	return hello(argc, argv);

}