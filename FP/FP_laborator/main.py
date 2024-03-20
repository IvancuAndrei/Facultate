from prezentare.ui import *
from testare.teste import *


def main():
    toate_testele()
    print("1 = Meniu, 2 = Comenzi")
    c = int(input("Ce interfata doriti:"))
    if c == 1:
        meniu()
    else:
        comenzi()

main()
