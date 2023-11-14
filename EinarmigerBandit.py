##August 2023
import random

zahl = 10
for i in iter(int,1):
    zahl -= 1
    zahl1 = random.randint(0, 9)
    zahl2 = random.randint(0, 9)
    zahl3 = random.randint(0, 9)
    if zahl1 == zahl2 and zahl2 == zahl3:
        zahl = zahl + 10
        print(zahl1, '  |  ', zahl2, '  |  ', zahl3, '  |   10 Coins, Guthaben ', zahl, 'Coins')
    elif zahl1 == zahl2 and zahl2 != zahl3:
        zahl = zahl + 3
        print(zahl1, '  |  ', zahl2, '  |  ', zahl3, '  |   3 Coins, Guthaben ', zahl, 'Coins')
    elif zahl1 == zahl3 and zahl3 != zahl2:
        zahl = zahl + 3
        print(zahl1, '  |  ', zahl2, '  |  ', zahl3, '  |   3 Coins, Guthaben ', zahl, 'Coins')
    elif zahl2 == zahl3 and zahl3 != zahl1:
        zahl = zahl + 3
        print(zahl1, '  |  ', zahl2, '  |  ', zahl3, '  |   3 Coins, Guthaben ', zahl, 'Coins')
    else:
        print(zahl1, '  |  ', zahl2, '  |  ', zahl3, '  |   leider verloren, Guthaben ', zahl, 'Coins')
    input()
    if zahl == 0:
        break
