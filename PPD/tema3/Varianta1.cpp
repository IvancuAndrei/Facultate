#include "Varianta1.h"
#include "Utils.h"

    void sumaMPI_Varianta1(const string& fisier1, const string& fisier2) {
        int rank, size;
        MPI_Comm_rank(MPI_COMM_WORLD, &rank);
        MPI_Comm_size(MPI_COMM_WORLD, &size);

        int numarProceseCalcul = size - 1;
        int blocSize = 0;
        vector<int> rezultatFinal;

        if (rank == 0) {
            // Procesul 0 deschide fișierele și citește blocurile de cifre
            ifstream file1(fisier1), file2(fisier2);
            int N1, N2;
            file1 >> N1; // numărul de cifre din primul număr
            file2 >> N2; // numărul de cifre din al doilea număr
            int N = std::max(N1, N2); // numărul maxim de cifre
            blocSize = (N + numarProceseCalcul - 1) / numarProceseCalcul;
            rezultatFinal.resize(N + 1); // rezerva pentru eventualul carry final

            // Trimitem dimensiunea blocului către toate procesele
            MPI_Bcast(&blocSize, 1, MPI_INT, 0, MPI_COMM_WORLD);

            // Distribuim câte un bloc de cifre la procesele slave până la finalul fișierului
            for (int id_proces_curent = 1; id_proces_curent <= numarProceseCalcul; ++id_proces_curent) {
                vector<int> blocNumar1(blocSize, 0), blocNumar2(blocSize, 0);

                // Citim câte `blocSize` cifre din fiecare fișier
                for (int i = 0; i < blocSize && !file1.eof(); ++i) {
                    file1 >> blocNumar1[i];
                }
                for (int i = 0; i < blocSize && !file2.eof(); ++i) {
                    file2 >> blocNumar2[i];
                }

                // Inversăm cifrele pentru a le avea în ordine de la cifra cea mai nesemnificativă
                reverse(blocNumar1.begin(), blocNumar1.end());
                reverse(blocNumar2.begin(), blocNumar2.end());

                // Trimitem blocurile către procesul curent
                MPI_Send(blocNumar1.data(), blocSize, MPI_INT, id_proces_curent, 0, MPI_COMM_WORLD);
                MPI_Send(blocNumar2.data(), blocSize, MPI_INT, id_proces_curent, 0, MPI_COMM_WORLD);
            }

            file1.close();
            file2.close();
        }
        else {
            // Procesul de calcul primește dimensiunea blocului
            MPI_Bcast(&blocSize, 1, MPI_INT, 0, MPI_COMM_WORLD);

            // Primește blocurile de cifre și calculează suma parțială
            vector<int> blocNumar1(blocSize);
            vector<int> blocNumar2(blocSize);
            vector<int> sumaPartiala(blocSize);

            MPI_Recv(blocNumar1.data(), blocSize, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            MPI_Recv(blocNumar2.data(), blocSize, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

            // Calculăm suma blocului și carry-ul
            int carry = 0;
            for (int i = 0; i < blocSize; ++i) {
                int suma = blocNumar1[i] + blocNumar2[i] + carry;
                sumaPartiala[i] = suma % 10;
                carry = suma / 10;
            }

            // Transmitem carry-ul următorului proces
            if (rank < size - 1) {
                MPI_Send(&carry, 1, MPI_INT, rank + 1, 0, MPI_COMM_WORLD);
            }

            // Actualizăm suma cu carry-ul primit de la procesul anterior, dacă există
            if (rank > 1) {
                int carryPrev;
                MPI_Recv(&carryPrev, 1, MPI_INT, rank - 1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
                for (int i = 0; i < blocSize; ++i) {
                    int suma = sumaPartiala[i] + carryPrev;
                    sumaPartiala[i] = suma % 10;
                    carryPrev = suma / 10;
                }
            }

            // Trimitem suma parțială înapoi la procesul 0
            MPI_Send(sumaPartiala.data(), blocSize, MPI_INT, 0, 0, MPI_COMM_WORLD);
        }

        if (rank == 0) {
            // Procesul 0 adună rezultatele de la toate procesele
            int index = 0;
            for (int i = 1; i <= numarProceseCalcul; ++i) {
                int recvSize = min(blocSize, static_cast<int>(rezultatFinal.size()) - index);
                MPI_Recv(&rezultatFinal[index], recvSize, MPI_INT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
                index += recvSize;
            }

            // Scriem rezultatul în fișierul de ieșire
            scrieNumarInFisier(rezultatFinal, "RezultatVarianta1.txt");
        }

   
    }