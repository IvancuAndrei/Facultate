from matplotlib import pyplot as plt
from scipy.stats import uniform
from matplotlib.pyplot import bar, show, hist, grid, legend, xticks, yticks
from math import log, exp
from matplotlib.pyplot import show, hist, grid, legend, xticks, plot
from scipy.stats import expon


def problema1(valori, probabilitati, N):
    unif = uniform.rvs(size=N)

    frecventa_valori = {
        "0": 0,
        "A": 0,
        "B": 0,
        "AB": 0
    }

    for u in unif:
        k = 0
        cond = False
        while not cond:
            k = k + 1
            sum_inf = sum(probabilitati[0:k])
            sum_sup = sum(probabilitati[0:k + 1])
            if sum_inf < u <= sum_sup:
                cond = True

        valoare_aleasa = valori[k]

        frecventa_valori[valoare_aleasa] = frecventa_valori[valoare_aleasa] + 1

    frecventa_relativa = [frecventa_valori[val] / N for val in frecventa_valori.keys()]

    print(frecventa_valori)

    # histograma
    plt.bar(valori[1:], frecventa_relativa, alpha=0.5, label='Frecvență relativă')
    plt.bar(valori[1:], probabilitati[1:], alpha=0.5, label='Probabilități teoretice')
    plt.xlabel('Grupe de sânge')
    plt.ylabel('Probabilitate / Frecvență relativă')
    plt.title('Histogramă pentru grupele de sânge')
    plt.legend()
    plt.show()


def problema2():
    N = 2000
    unif = uniform.rvs(size=N)
    alfa = 1/12

    data = [-1 / alfa * log(1 - u) for u in unif]
    hist(data, bins=12, density=True, range=(0, 61))
    x = range(60)
    plot(x, expon.pdf(x, loc=0, scale=1 / alfa), 'r-')
    xticks(range(0, 60, 5))
    grid()
    show()

    probabilitate_simulari = sum(x >= 5 for x in data) / N
    probabilitate_teoretica = 1 - expon.cdf(5, scale=1/alfa)
    print("Probabilitate simulari ", probabilitate_simulari)
    print("Probabilitatea teoretica ", probabilitate_teoretica)


def main():
    problema1(valori=["-", "0", "A", "B", "AB"], probabilitati=[0, 0.46, 0.4, 0.1, 0.04], N=1000)
    problema2()


main()