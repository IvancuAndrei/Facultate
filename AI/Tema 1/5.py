from collections import Counter

"""
Pentru un șir cu n elemente care conține valori din mulțimea {1, 2, ..., n - 1} astfel încât o singură valoare se repetă
de două ori, se identifica acea valoare care se repetă

Complexitate timp: O(n)
Complexitate spatiu: O(n)
"""
def rezolvare_5(text):
    frecventa_numere = Counter(text.split(","))
    for numar, frecventa in frecventa_numere.items():
        if frecventa == 2:
            return numar

def testare():
    assert(rezolvare_5("1,2,2,3,4") == "2")
    assert(rezolvare_5("1,1,2,3,4") == "1")
    assert(rezolvare_5("1,2,3,1,4") == "1")

testare()
print("Testare reusita !")

text = input()
print("Numar: ", rezolvare_5(text))
