#August 2023

import random
runde = 0
win = 0
print('Errate eine Zahl zwischen 1 und 10')
while runde != 10:
    runde += 1
    count = 0
    guess_num = random.randint(1, 10)
    while count != 3:
        guess = int(input('Wie lautet dein Tip? '))

        if guess == guess_num:
            count = 3
            win += 1
            print('Super gemacht die richtige zahl war ', guess_num)
            print('Sie haben ', win, 'von', runde, 'gewonnen')
        elif guess != guess_num:
            print('leider Falsch')
            count = count + 1
        elif count == 3:
            print('Leider nicht geschaft die richtige Zahl wäre ', guess_num, 'gewesen')

        if guess_num - 1 == guess or guess_num + 1 == guess:
            print('Heiß!')
        elif guess_num - 2 == guess or guess_num + 2 == guess:
            print('Warm!')
        elif guess_num != guess:
            print('Kalt!')




if win <= 7:
    print('Ihre Bewertung: Amateur')
elif win == 8:
    print('Ihre Bewertung: Fortgeschritten')
elif win <= 9:
    print('Ihre Bewertung: Profi')
elif win <= 10:
    print('Ihre Bewertung: Hacker')

