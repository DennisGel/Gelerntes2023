def menu(y):
    auswahl = []
    if y == 'c' or y == 'k' or y == 'f':
        auswahl.append(y)
        if y == 'c':
            print('In Welche Einheit wollen Sie umwandeln?')
            print('Kelvin (k)')
            print('Fahrenheit (f)')
            auswahl.append(input())
            return auswahl

        elif y == 'k':
            print('In Welche Einheit wollen Sie umwandeln?')
            print('Celsius (c)')
            print('Fahrenheit (f)')
            auswahl.append(input())
            return auswahl


        elif y == 'f':
            print('In Welche Einheit wollen Sie umwandeln?')
            print('Kelvin (k)')
            print('Celsius (c)')
            auswahl.append(input())
            return auswahl
    else:
        auswahl = 0
        return auswahl

def CnachF(y):
    ergebnis = ((y * 9) / 5) + 32
    return ergebnis

def CnachK(y):
    ergebnis = y + 273.15
    return ergebnis

def FnachC(y):
    ergebnis = ((y - 32) * 5) / 9
    return ergebnis


def FnachK(y):
    ergebnis = ((y - 32) * 5) / 9 + 273.15
    return ergebnis

def KnachC(y):
    ergebnis = y - 273.15
    return ergebnis

def KnachF(y):
    ergebnis = ((y - 273.15) * 9 / 5) + 32
    return ergebnis

def rechnung(x,y):
    if x[0] == 'c':
        if x[1] == 'f':
            ergebnis = CnachF(y)
        else:
            ergebnis = CnachK(y)
        return ergebnis

    if x[0] == 'k':
        if x[1] == 'c':
            ergebnis = KnachC(y)
        else:
            ergebnis = KnachF(y)
        return ergebnis

    if x[0] == 'f':
        if x[1] == 'c':
           ergebnis = FnachC(y)
        else:
           ergebnis = FnachK(y)
        return ergebnis

von_einheit = 0
while von_einheit != 'e':
    von_einheit = input('Bitte geben Sie Ihre derzeitige Temparatureinheit an (c/k/f).\nZum abbrechen "e" ').lower()
    if von_einheit != 'e':
        wert = float(input('Bitte geben Sie den umzuwandelnden Wert an: '))
        auswahl_m = menu(von_einheit)
        if auswahl_m == 0:
            print('Ungültige Eingabe!')
            continue
        ausgabe = rechnung(auswahl_m, wert)

        print('Das Ergebnis ist: ', ausgabe)
    elif von_einheit != ('e', 'f', 'k', 'c'):
        print('Ungültige Eingabe!')
print('Vielen Dank!')
