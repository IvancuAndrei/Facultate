from scipy.stats import bernoulli
import matplotlib.pyplot as plt
from scipy.stats import hypergeom, geom
import numpy as np

# def simulate_displacement(num_steps, probability):
#     current_position = 0
#     positions = [current_position]
#
#     for _ in range(num_steps):
#         move_right = bernoulli.rvs(probability)
#         if move_right:
#             current_position += 1
#         else:
#             current_position -= 1
#
#         positions.append(current_position)
#
#     return positions
#
# # Simulare de 100 de pași cu probabilitatea p = 0.5
# num_steps = 100
# probability = 0.5
#
# # Obține pozițiile curente la fiecare pas
# positions = simulate_displacement(num_steps, probability)
#
# # Afișează rezultatele
# for step, position in enumerate(positions):
#     print(f"Step {step}: Position {position}")
#
# def simulate_multiple_displacements(num_simulations, num_steps, probability):
#     final_positions = []
#
#     for _ in range(num_simulations):
#         positions = simulate_displacement(num_steps, probability)
#         final_positions.append(positions[-1])
#
#     return final_positions
#
# # Simulare de 1000 de deplasări cu 100 de pași fiecare, probabilitatea p = 0.5
# num_simulations = 1000
# num_steps = 100
# probability = 0.5
#
# final_positions = simulate_multiple_displacements(num_simulations, num_steps, probability)
#
# # Histograma pozițiilor finale
# plt.hist(final_positions, bins=range(min(final_positions), max(final_positions) + 2), align='left', edgecolor='black')
# plt.xlabel('Poziție finală')
# plt.ylabel('Frecvență')
# plt.title('Histograma Pozițiilor Finale')
# plt.xticks(range(min(final_positions), max(final_positions) + 1))
# plt.grid(True)
# plt.show()






# def simulate_circular_displacement(num_steps, probability, num_nodes):
#     current_position = 0
#     positions = [current_position]
#
#     for _ in range(num_steps):
#         move_right = bernoulli.rvs(probability)
#         if move_right:
#             current_position = (current_position + 1) % num_nodes
#         else:
#             current_position = (current_position - 1) % num_nodes
#
#         positions.append(current_position)
#
#     return positions
#
# def simulate_multiple_circular_displacements(num_simulations, num_steps, probability, num_nodes):
#     final_positions = []
#
#     for _ in range(num_simulations):
#         positions = simulate_circular_displacement(num_steps, probability, num_nodes)
#         final_positions.append(positions[-1])
#
#     return final_positions
#
# # Simulare de 1000 de deplasări circulare cu 100 de pași fiecare, probabilitatea p = 0.5, 10 noduri
# num_simulations = 1000
# num_steps = 200
# probability = 0.5
# num_nodes = 50
#
# final_positions_circular = simulate_multiple_circular_displacements(num_simulations, num_steps, probability, num_nodes)
#
# # Histograma pozițiilor finale pe cerc
# plt.hist(final_positions_circular, bins=range(num_nodes + 1), align='left', edgecolor='black')
# plt.xlabel('Poziție finală pe cerc')
# plt.ylabel('Frecvență')
# plt.title(f'Histograma Pozițiilor Finale pe Cerc cu {num_nodes} Noduri')
# plt.xticks(range(num_nodes))
# plt.grid(True)
# plt.show()


class LotterySimulator:
    def __init__(self, num_total_tickets, num_winning_tickets, draw_size):
        self.num_total_tickets = num_total_tickets
        self.num_winning_tickets = num_winning_tickets
        self.draw_size = draw_size

    def simulate_until_win(self):
        num_simulations = 0
        num_losing_tickets = 0

        while True:
            tickets_drawn = np.random.choice(self.num_total_tickets, self.draw_size, replace=False)
            num_winning_numbers = np.sum(np.isin(tickets_drawn, np.arange(self.num_winning_tickets)))

            num_simulations += 1

            if num_winning_numbers >= 3:
                break
            else:
                num_losing_tickets += 1

        return num_losing_tickets, num_simulations

# Simulare pentru numărul de bilete necâștigătoare până la primul bilet câștigător
simulator = LotterySimulator(num_total_tickets=49, num_winning_tickets=6, draw_size=6)
num_simulations = 5000

losing_tickets_list = []
for _ in range(num_simulations):
    num_losing_tickets, _ = simulator.simulate_until_win()
    losing_tickets_list.append(num_losing_tickets)

# Estimare probabilitate pentru cel puțin 10 bilete succesive necâștigătoare
num_successive_losing_tickets = 10
successive_losing_probability_simulated = np.mean(np.array(losing_tickets_list)[:num_successive_losing_tickets] >= num_successive_losing_tickets)

# Estimare probabilitate teoretică
p = sum(hypergeom.pmf(k,49,6,6) for k in range(3,7))
prob_successive_losing = 1 - geom.cdf(9,p)
# Afișează rezultatele
print("i) Lista numărului de bilete necâștigătoare până la primul bilet câștigător:")
print(losing_tickets_list)

print("\nii) Estimarea probabilității pentru cel puțin 10 bilete succesive necâștigătoare:")
print("Probabilitate simulată:", successive_losing_probability_simulated)
print("Probabilitate teoretică :", prob_successive_losing)