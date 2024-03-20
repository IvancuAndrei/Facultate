import random
from random import randrange, randint
from matplotlib.pyplot import bar, hist, grid, show, legend, xlabel, ylabel, title
from scipy.stats import binom
import numpy as np



# def extrage_bile(urna, numar_bile):
#     return random.sample(urna, numar_bile)
#
# def verificare_A(bile_extrase):
#     return any(bila == 'rosie' for bila in bile_extrase)
#
# def verificare_B(bile_extrase):
#     return all(bila == bile_extrase[0] for bila in bile_extrase)
#
# urna = ['rosie', 'rosie', 'rosie', 'rosie', 'rosie', 'albastra', 'albastra', 'albastra', 'verde', 'verde']
# numar_simulari = 10000
# numar_cazuri_B_dupa_A = 0
#
# for _ in range(numar_simulari):
#     bile_extrase = extrage_bile(urna, 3)
#     if verificare_A(bile_extrase) and verificare_B(bile_extrase):
#         numar_cazuri_B_dupa_A += 1
#
# probabilitate_B_dupa_A = numar_cazuri_B_dupa_A / numar_simulari
# print(f"Estimarea probabilitatii P(B|A) prin simulare repetata: {probabilitate_B_dupa_A}")
#
# def probabilitate_B_dupa_A_teoric():
#     P_A_B = (5/10) * (4/9) * (3/8) + (3/10) * (2/9) * (1/8)
#     P_A = 1 - (3/10) * (2/9) * (1/8) - (2/10) * (1/9) * (0/8)
#     return P_A_B / P_A
#
# probabilitate_teorica_B_dupa_A = probabilitate_B_dupa_A_teoric()
# print(f"Valoarea teoretica a probabilitatii P(B|A): {probabilitate_teorica_B_dupa_A}")
    




# data = [randrange(1, 7) for _ in range(500)]
# bin_edges = [k+0.5 for k in range(0, 7)]
# hist(data, bins=bin_edges, density=True, rwidth=0.9, color='green', edgecolor='black', alpha=0.5, label='frecvente relative')
# distribution = dict([(i, 1/6) for i in range(1, 7)])
# bar(distribution.keys(), distribution.values(), width=0.85, color='red', edgecolor='black', alpha=0.6, label='probabilitati')
# legend(loc='lower left')
# grid()
# show()





# n = 5
# p = 6/10
# q = 4/10
#
# valori_X = binom.rvs(n, p, size=1000)
# print(valori_X[:20])
#
# hist(valori_X, bins=np.arange(0, 6)-0.5, density=True, color='green', alpha=0.5, edgecolor='black', rwidth=0.8, label='frecvente relative')
#
# valori_pmf = [binom.pmf(k, n, p) for k in range(6)]
#
# bar(range(6), valori_pmf, width=0.85, color='red', alpha=0.6, label='probabilitati teoretice')
#
# legend()
# grid(True)
# show()
#
# probabilitate_estimata = binom.cdf(5, n, p) - binom.cdf(2, n, p)
#
# probabilitate_teoretica = sum(valori_pmf[3:])
#
# print(f"Estimarea probabilitatii P(2 < X <= 5): {probabilitate_estimata}")
# print(f"Valoarea teoretica a probabilitatii P(2 < X <= 5): {probabilitate_teoretica}")



def aruncare_zar():
    return [randint(1, 6) for _ in range(3)]

def numar_casti(zar, numar_ales):
    suma = 0
    for numar in zar:
        suma += numar
    return suma == numar_ales

numar_simulari = 100000
numere_possibile = range(3, 19)
castiguri_simulate = []

for numar_ales in numere_possibile:
    castiguri = 0
    for _ in range(numar_simulari):
        zar = aruncare_zar()
        castiguri += numar_casti(zar, numar_ales)
    castiguri_simulate.append(castiguri)


bar(numere_possibile, castiguri_simulate, color='blue', alpha=0.6)
xlabel('Numar ales')
ylabel('Numar de castiguri')
title('Histograma frecventelor castigurilor simulate')
show()

numar_ales_optim_simulare = numere_possibile[castiguri_simulate.index(max(castiguri_simulate))]
print(f"Numarul optim ales prin simulare este: {numar_ales_optim_simulare}")

def probabilitate_castig(numar_ales):
    probabilitate = 0
    for i in range(1, 7):
        for j in range(1, 7):
            for k in range(1, 7):
                suma = i + j + k
                if suma == numar_ales:
                    probabilitate += (1/6) * (1/6) * (1/6)
    return probabilitate

probabilitati_teorice = [probabilitate_castig(numar) for numar in numere_possibile]


bar(numere_possibile, probabilitati_teorice, color='red', alpha=0.6)
xlabel('Numar ales')
ylabel('Probabilitate')
title('Histograma probabilitatilor teoretice')
show()

numar_ales_optim_teorie = numere_possibile[probabilitati_teorice.index(max(probabilitati_teorice))]
print(f"Numarul optim ales prin probabilitati teoretice este: {numar_ales_optim_teorie}")

