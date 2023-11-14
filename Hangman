# Aufgabe: Wörter raten
# Schreiben Sie ein kleines Spiel bei dem man Wörter erraten muss.
# Vorgaben: eine Liste mit Tiergattungen, mindestens 21 Wörter [Löwe, Affe, Python, Elefant….usw]
# Für das Spiel mit dem User:
# - ein Wort zufällig auswählen
# - User gibt einen Buchstaben ein oder "ende" als Wort
# - Bei "ende" Eingabe: das Spiel beenden
# - Bei Buchstabeneingabe
# - Buchstabe ist im Wort enthalten: das Wort mit dem Format
# ...X...X.. den Buchstaben am jeweiligen Platz ausgeben
# sind vorher schon Buchstaben richtig gewesen, diese ebenfalls
# mit ausgeben: ..aX...Xen
# sind alle Buchstaben erkannt: Lob ausgeben
# - Maximale Anzahl an Versuchen: Wortlänge + 9

import random


# Funktion zum Prüfen ob Buchstabe erraten
def buchstabe_abfrage(guess_f, wort_f):
    pattern = ''
    for i in range(len(wort_f)):
        # ob es als Großbuchstabe vorkommt
        if guess_f.upper() == wort_f[i]:
            pattern = pattern + guess_f.upper()
        # ob es als Kleinbuchstabe vorkommt
        if guess_f.lower() == wort_f[i]:
            pattern = pattern + guess_f.lower()
        # wenn nicht dan '.'
        else:
            pattern = pattern + '.'
    return pattern


# verbindet beide Pattern
def pattern_fusion(wort_f, pattern1, pattern2):
    # Parameter zu Array
    pattern1 = list(pattern1)
    pattern2 = list(pattern2)
    for i in range(len(wort_f)):
        if pattern1[i] == '.' and pattern2[i] != '.':
            # wenn in neuem Pattern NICHT '.' ersetzen durch Buchstabe
            pattern1.pop(i)
            pattern1.insert(i, pattern2[i])
    return pattern1


# Konvertiert Arrays zu Strings
def array_zu_string(s):
    # Trennzeichen zwischen Arrayelementen
    str1 = ""
    return str1.join(s)


# Hauptprogramm
# Deklaration und Initialisierung von Variablen
memory = 0
guess_word = ''
# Zufallszahl generieren
index_wort = random.randint(0, 20)
# Liste der zu erratenden Begriffe
liste = ['Affe', 'Python', 'Hund', 'Katze', 'Wolf', 'Wurm', 'Pferd', 'Vogel', 'Tiger', 'Huhn', 'Fisch', 'Oktopus',
         'Fliege',
         'Rabe', 'Wollmilchsau', 'Einhorn', 'Schmetterling', 'Raupe', 'Maulwurf', 'Giraffe', 'Flamingo']
# Legt das Wort anhand der Zufallszahl fest
wort = liste[index_wort]
# Zähler der verbleibenden Runden
count = len(wort) + 9
# Informationen für Nutzer
print('In diesem Spiel geht es darum mittels erraten von Buchstaben ein Tier zu finden.')
print('Du hast ', count, 'Versuche!')

# Spielstart
while count > 0:

    # Wenn erraten = Lob + ende
    if guess_word == wort:
        print('Gut gemacht das Tier war:', wort)
        break

    # Ausgabe, nur wenn nicht 1. Runde
    if count != len(wort) + 9:
        print('Du hast noch', count, 'Versuche!')

    # Nutzer Eingabe
    guess = input('Bitte gib einen Buchstaben ein: ')

    # Prüfung ob nur ein wert eingegeben
    if len(guess) == 1:
        # Aufruf der Vergleichsfunktion
        output = buchstabe_abfrage(guess, wort)
        # Wenn nicht in der ersten Runde Funktion für Verbinden von Pattern
        if memory != 0:
            output = pattern_fusion(wort, output, memory)
        # Schreibe neues Pattern in Variable für nächsten Durchgang
        memory = output
        # Zähler um 1 verringern
        count -= 1
        # Aufruf der Array zu String Funktion
        guess_word = array_zu_string(memory)
        # Ausgabe des Fortschrittes
        print(guess_word)
    # Wenn eingabe länger als 1
    else:
        print('Ungültige Eingabe!')
        # Zurück zum Anfang
        continue
