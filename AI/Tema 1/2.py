import math

"""
Se determina distanța Euclideană între două locații identificate prin perechi de numere.

Complexitate timp: tetha(1)
Complexitate spatiu: O(1)
"""
def rezolvare_2(x1, y1, x2, y2):
    distanta = math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
    return distanta

def testare():
    assert(rezolvare_2(1, 2, 4, 6) == 5)
    assert(rezolvare_2(0, 0, 5, 12) == 13)
    assert(rezolvare_2(3,0,0,4) == 5)

testare()
print("Testare reusita !")

ax = int(input("Prima coordonata pentru A: "))
ay = int(input("A doua coordonata pentru A: "))
bx = int(input("Prima coordonata pentru B: "))
by = int(input("A doua coordonata pentru B: "))

print("Distanta: ", rezolvare_2(ax, ay, bx, by))
