import random
import numpy as np
import matplotlib.pyplot as plt
import math

def problema_1():
    def are_doua_aniversari_aceleasi(grup):
        return len(grup) != len(set(grup))

    numar_simulari = 10000
    numar_grupuri = 23
    numar_grupuri_cu_aceeasi_aniversare = 0

    for _ in range(numar_simulari):
        aniversari = [random.randint(1, 365) for _ in range(numar_grupuri)]
        if are_doua_aniversari_aceleasi(aniversari):
            numar_grupuri_cu_aceeasi_aniversare += 1

    probabilitate = numar_grupuri_cu_aceeasi_aniversare / numar_simulari
    print(
        f"Probabilitatea ca cel puțin două persoane să aibă aceeași zi de naștere într-un grup de {numar_grupuri} este aproximativ: {probabilitate:.4f}")


def problema_2_a():
    def punct_in_cerc(x, y):
        return x ** 2 + y ** 2 <= 0.5 ** 2

    def punct_mai_apropiat_de_centru(x, y):
        return np.logical_and(x ** 2 + y ** 2 < 1 / 4, x ** 2 + y ** 2 < (3 - 2 * math.sqrt(2)) / 4)

    def punct_in_triunghi_ascutitunghic(x, y):
        return x ** 2 + y **2 <= 1/4

    def punct_in_triunghi_obtuzunghic(x, y):
        return np.logical_or((np.logical_and(x > 0,y < 0)),(np.logical_and(x < 0,y > 0)))

    def genereaza_puncte(N):
        puncte = np.random.rand(N, 2) - 0.5
        return puncte

    def calculeaza_frecventa(puncte, conditie):
        puncte_care_indeplinesc_conditia = np.sum(conditie(puncte[:, 0], puncte[:, 1]))
        frecventa_relativa = puncte_care_indeplinesc_conditia / len(puncte)
        return frecventa_relativa

    N_valori = [500, 1000, 2000]

    for N in N_valori:
        puncte = genereaza_puncte(N)

        frecventa_cerc = calculeaza_frecventa(puncte, punct_in_cerc)
        frecventa_apropiat_de_centru = calculeaza_frecventa(puncte, punct_mai_apropiat_de_centru)
        frecventa_triunghi_ascutitunghic = calculeaza_frecventa(puncte, punct_in_triunghi_ascutitunghic)
        frecventa_triunghi_obtuzunghic = calculeaza_frecventa(puncte, punct_in_triunghi_obtuzunghic)

        print(f'Pentru N = {N}:')
        print(f'Frecventa punctelor in interiorul cercului: {frecventa_cerc:.4f}')
        print(f'Frecventa punctelor mai apropiate de centrul patratului: {frecventa_apropiat_de_centru:.4f}')
        print(f'Frecventa punctelor in triunghiuri ascutitunghice: {frecventa_triunghi_ascutitunghic:.4f}')
        print(f'Frecventa punctelor in triunghiuri obtuzunghice: {frecventa_triunghi_obtuzunghic:.4f}')
        print('\n')

def problema_2_b():
    def punct_in_cerc(x, y):
        return x ** 2 + y ** 2 <= 0.5 ** 2

    def punct_mai_apropiat_de_centru(x, y):
        return np.logical_and(x ** 2 + y **2 < 1/4, x ** 2 + y ** 2 < (3 - 2 * math.sqrt(2)) / 4)

    def punct_in_triunghi_ascutitunghic(x, y):
        return np.logical_and(x > 0, y > 0)

    def punct_in_triunghi_obtuzunghic(x, y):
        return np.logical_or((np.logical_and(x > 0, y < 0)), (np.logical_and(x < 0, y > 0)))

    def genereaza_puncte(N):
        puncte = np.random.rand(N, 2) - 0.5
        return puncte

    def calculeaza_frecventa(puncte, conditie):
        puncte_care_indeplinesc_conditia = np.sum(conditie(puncte[:, 0], puncte[:, 1]))
        frecventa_relativa = puncte_care_indeplinesc_conditia / len(puncte)
        return frecventa_relativa

    N_valori = [1000]

    def reprezinta_puncte(puncte, conditie, titlu):
        plt.figure(figsize=(6, 6))
        plt.scatter(puncte[:, 0], puncte[:, 1], c=conditie(puncte[:, 0], puncte[:, 1]), cmap='viridis', s=10)
        plt.colorbar(label='Conditie indeplinita')
        plt.title(titlu)
        plt.xlim(-0.6, 0.6)
        plt.ylim(-0.6, 0.6)
        plt.gca().set_aspect('equal', adjustable='box')
        plt.show()

    for N in N_valori:
        puncte = genereaza_puncte(N)

        reprezinta_puncte(puncte, punct_in_cerc, f'Puncte in interiorul cercului pentru N={N}')
        reprezinta_puncte(puncte, punct_mai_apropiat_de_centru,
                          f'Puncte mai apropiate de centrul patratului pentru N={N}')
        reprezinta_puncte(puncte, punct_in_triunghi_ascutitunghic, f'Puncte in triunghiuri ascutitunghice pentru N={N}')
        reprezinta_puncte(puncte, punct_in_triunghi_obtuzunghic, f'Puncte in triunghiuri obtuzunghice pentru N={N}')




if __name__ == '__main__':
    problema_1()
#  problema_2_a()
#    problema_2_b()


