"""
Se determina ultimul (din punct de vedere alfabetic) cuvânt care poate apărea într-un text care conține mai multe
cuvinte separate prin ” ” (spațiu).

Complexitate timp: O(n)
Complexitate spatiu: O(n)
"""

def rezolvare_1(linie):
    cuvinte = linie.split()
    maxx = max(cuvinte, key = str.lower)
    return maxx
def testare():
     assert(rezolvare_1("Ana are mere rosii") == "rosii")
     assert(rezolvare_1("Buna ma numesc Robert") == "Robert")
     assert(rezolvare_1("Hai sa plecam") == "sa")

testare()
print("Testare reusita !")

linie = input()
print(rezolvare_1(linie))
