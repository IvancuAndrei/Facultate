'''

pronos = ['1', 'X', '2']

def backRec(i, n, arr):
    if solution(arr[:i], n):
        if consistent(arr):
            print(arr)
        return

    for prono in pronos:
        arr[i] = prono
        backRec(i + 1, n, arr)


def solution(arr, n):
    return len(arr) == n


def consistent(arr):
    if arr[-1] == 'X':
        return False

    counter1 = 0
    for i in range(len(arr)):
        if arr[i] == '1':
            counter1 += 1
    if counter1 > 2:
        return False

    return True


n = int(input("Introduceti numarul de pronosticuri: "))
backRec(0, n, [0 for i in range(n)])
'''


def backtIter(n):
    pronos = ["1", "X", "2"]
    tickets = []
    for i in range(n):
        if i == 0:
            for prono in pronos:
                tickets.append([prono])
        else:
            new_tickets = []
            for ticket in tickets:
                for prono in pronos:
                    new_tickets.append(ticket + [prono])
                    if solution(new_tickets[-1], n):
                        if not consistent(new_tickets[-1]):
                            new_tickets.pop(-1)
            tickets = new_tickets
    return tickets


def solution(arr, n):
    return len(arr) == n


def consistent(arr):
    if arr[-1] == 'X':
        return False

    counter1 = 0
    for i in range(len(arr)):
        if arr[i] == '1':
            counter1 += 1
    if counter1 > 2:
        return False

    return True


n = int(input("Introduceti numarul de pronosticuri: "))
tickets = backtIter(n)

for ticket in tickets:
    print(ticket)

'''

Solutie candidat: x=(x0, x1,..., xk), xi∈(1, 2, X)
Conditie consistent: x=(x0, x1,..., xk) e consistent daca (k = n - 1 si xk ≠ X) si exista maxim doua meciuri cu pronosticul 1
                    counter1 <= 2 (counter1 +=1 daca xi = 1)
Conditie solutie: x=(x0, x1,..., xk) e solutie daca e consistent si k = n - 1

'''