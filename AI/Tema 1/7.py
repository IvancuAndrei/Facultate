"""
Se determina al k-lea cel mai mare element al unui șir de numere cu n elemente (k < n).

Complexitate timp: O(n logn)
Complexitate spatiu: O(n)
"""
def rezolvare_7(n, k, v):
    v.sort(reverse=True)
    return v[k - 1]
def testare():
    assert(rezolvare_7(5, 1, [1,2,3,4,5]) == 5)
    assert(rezolvare_7(6, 3, [1,2,3,4,5,7]) == 4)
    assert(rezolvare_7(3, 2, [7,7,8]) == 7)

testare()
print("Testare reusita !")

n = int(input())
k = int(input())
v = []
for i in range(n):
    v.append(int(input()))

print(rezolvare_7(n, k, v))