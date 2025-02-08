#include <iostream>
#include <vector>

#include "Varianta0.h"
#include "Varianta1.h"

using namespace std;

int main(int argc, char** argv) {

	MPI_Init(&argc, &argv);

	sumaMPI_Varianta1("Numar1.txt", "Numar2.txt");

	adunaNumereMariSecvential();

	MPI_Finalize();
}
	