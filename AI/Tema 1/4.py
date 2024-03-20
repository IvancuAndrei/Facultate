from collections import Counter

"""
Să se determine cuvintele unui text care apar exact o singură dată în acel text.

Complexitate timp: O(n)
Complexitate spatiu: O(n)
"""
def rezolvare_4(text):
    frecventa_cuvinte = Counter(text.split())
    cuvinte_o_singura_data = [cuvant for cuvant, frecventa in frecventa_cuvinte.items() if frecventa == 1]
    return cuvinte_o_singura_data

def testare():
    assert(rezolvare_4("ana ana ana mere rosii rosii") == ["mere"])
    assert(rezolvare_4("buna buna sunt ana") == ["sunt", "ana"])
    assert(rezolvare_4("Hai sa mergem") == ["Hai", "sa", "mergem"])

testare()
print("Testare reusita !")

text = input()
print(rezolvare_4(text))
