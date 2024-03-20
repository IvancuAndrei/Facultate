from scipy.integrate import quad
from scipy.stats import norm
from numpy import mean, std, linspace
from matplotlib.pyplot import show, hist, grid, legend, xticks, plot
from scipy.stats import expon, uniform
from numpy import mean, std, multiply, exp
from scipy.stats import expon, uniform

# Parametrii distributiei normale
m = 165  # medie
sigma = 10  # deviatia standard

# Numarul de simulări
n_values = [1000, 2000, 5000]

for n in n_values:
    # Simulare de n valori aleatoare din distributia normala
    simulated_data = norm.rvs(loc=m, scale=sigma, size=n)

    # i) Histograma cu 16 bare, pe intervalul [130, 210]
    hist(simulated_data, bins=16, range=(130, 210), density=True, color='blue', alpha=0.7, label=f'n={n}')

    # ii) Calcul valoarea medie, deviatia standard si proportia de valori in intervalul [160, 170]
    mean_value = mean(simulated_data)
    std_deviation = std(simulated_data)
    proportion_160_170 = ((simulated_data >= 160) & (simulated_data <= 170)).mean()

    print(f"n={n}: Medie={mean_value:.2f}, Deviatie standard={std_deviation:.2f}, Proportie [160, 170]={proportion_160_170:.2%}")

    prob_exacta = norm.cdf(170, loc=165, scale=10) - norm.cdf(160, loc=165, scale=10)
    print(prob_exacta)


    # Adaugare grafic functie de densitate
    x = linspace(130, 210, 1000)
    y = norm.pdf(x, loc=m, scale=sigma)
    plot(x, y, 'r-', linewidth=2, label='Densitate normala')

    # Stilizare grafic
    grid()
    legend()
    xticks(range(130, 211, 10))
    show()




# # Parametrii pentru distribuția Exponentială
# miu_T1 = 5  # medie
# lambda_T1 = 1 / miu_T1  # parametru de rată
#
# # Parametrii pentru distribuția Uniformă
# a_T2 = 4  # valoarea minimă
# b_T2 = 6  # valoarea maximă
#
# # a) Estimarea valorii medii și deviației standard pentru timpul de printare
# mean_T1 = miu_T1
# mean_T2 = (a_T2 + b_T2) / 2
#
# variance_T1 = miu_T1 ** 2
# variance_T2 = ((b_T2 - a_T2) ** 2) / 12
#
# # Simularea datelor pentru distribuția Exponentială și Uniformă
# simulated_data_T1 = expon.rvs(scale=miu_T1, size=int(0.4 * 1e6))
# simulated_data_T2 = uniform.rvs(loc=a_T2, scale=(b_T2 - a_T2), size=int(0.6 * 1e6))
#
# mean_print_time = 0.4 * mean_T1 + 0.6 * mean_T2
# variance_print_time = 0.4 * variance_T1 + 0.6 * variance_T2
#
# std_print_time = std(list(simulated_data_T1) + list(simulated_data_T2))
#
# print(f"a) Estimare medie: {mean_print_time:.2f}, Deviație standard: {std_print_time:.2f}")
#
# # b) Estimarea probabilității ca timpul de printare să fie mai mic de 5 secunde
# prob_less_than_5 = 0.4 * expon.cdf(5, scale=miu_T1) + 0.6 * uniform.cdf(5, loc=a_T2, scale=(b_T2 - a_T2))
#
# print(f"b) Estimare probabilitate timp < 5 secunde: {prob_less_than_5:.2%}")
#
# # c) Probabilitatea teoretică pentru b)
# theoretical_prob_less_than_5 = 0.4 * expon.cdf(5, scale=miu_T1) + 0.6 * uniform.cdf(5, loc=a_T2, scale=(b_T2 - a_T2))
#
# print(f"c) Probabilitate teoretică timp < 5 secunde: {theoretical_prob_less_than_5:.2%}")





# # Definim funcția g(x)
# def g(x):
#     return exp(-x**2)
#
# # Parametrii intervalului [a, b]
# a = -1
# b = 3
#
# # Numărul de valori aleatoare generate
# n = 100000
#
# # Generăm valori aleatoare uniform distribuite pe intervalul [a, b]
# uniform_samples = uniform.rvs(loc=a, scale=(b - a), size=n)
#
# # Calculăm valoarea funcției g pentru fiecare valoare generată
# g_values = g(uniform_samples)
#
# # Estimarea integralei folosind metoda Monte Carlo
# monte_carlo_estimate = (b - a) * mean(g_values)
#
# g = lambda x: exp(-(x**2))
# rez = quad(g,-1,3)[0]
#
# print(f'Estimare calculata: {rez}')
# print(f'Estimare Monte Carlo pentru integrala: {monte_carlo_estimate:.6f}')