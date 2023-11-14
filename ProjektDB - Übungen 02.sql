-- Nutzen Sie die Datenbank ProjektDB,
-- um die folgenden Aufgaben zu lösen.


-- Aufgabe 2.1
--
-- Schreiben Sie eine Abfrage die Personalnummer,
-- Vorname, Nachname und den Name der Abteilung
-- der Mitarbeiter sortiert nach Personalnummer
-- ausgibt. Geben Sie nur die ersten drei Zeilen
-- aus.
--
--		m_nr	m_vorname	m_name		abt_name
--		2581	Brigitte	Kaufmann	Diagnose
--		9031	Rainer		Meier		Diagnose
--		10102	Petra		Huber		Freigabe

SELECT TOP(3)m_nr,m_vorname,m_name,abt_nr
FROM Mitarbeiter
ORDER BY m_nr

-- Aufgabe 2.2
--
-- Schreiben Sie eine Abfrage, die alle Projekt-Aufgaben 
-- mit den zugehörigen Projekten kombiniert. Geben Sie die
-- Felder pr_nr, pr_name, m_nr und aufgabe aus. Sortieren 
-- Sie die Ausgabe nach pr_nr aufsteigend und m_nr absteigend.
--
--		pr_nr	pr_name	m_nr	aufgabe
--		p1  	Apollo	29346	Sachbearbeiter 
--		p1  	Apollo	28559	NULL
--		p1  	Apollo	10102	Projektleiter  
--		p1  	Apollo	9031	Gruppenleiter  
--		p2  	Gemini	29346	NULL
--		p2  	Gemini	28559	Sachbearbeiter 
--		p2  	Gemini	25348	Sachbearbeiter 
--		p2  	Gemini	18316	NULL
--		p3  	Merkur	10102	Gruppenleiter  
--		p3  	Merkur	9031	Sachbearbeiter 
--		p3  	Merkur	2581	Projektleiter  
SELECT a.pr_nr,pr_name, m_nr,aufgabe
FROM Arbeiten a
	LEFT JOIN Projekt p 
		ON p.pr_nr=a.pr_nr
ORDER BY pr_nr , m_nr DESC;


-- Aufgabe 2.3
--
-- Erweitern Sie die Abfrage aus Aufgabe 2.2, indem Sie
-- zusätzlich noch den Nachnamen des Mitarbeiters im
-- Ergebnis mit ausgeben.
--
--		pr_nr	pr_name	m_nr	m_name	aufgabe
--		p1  	Apollo	29346	Probst	Sachbearbeiter
--		p1  	Apollo	28559	Mozer	NULL
--		p1  	Apollo	10102	Huber	Projektleiter
--		...
SELECT a.pr_nr,pr_name, m.m_nr,m_name,aufgabe
FROM Arbeiten a
	LEFT JOIN Projekt p 
		ON p.pr_nr=a.pr_nr
	LEFT JOIN Mitarbeiter m ON a.m_nr=m.m_nr
ORDER BY pr_nr , m.m_nr DESC;

-- Aufgabe 2.4
--
-- Erweitern Sie die Abfrage aus Augfgabe 2.3, indem Sie
-- zusätzlich noch den Namen der Abteilung des Mitarbeiters
-- im Ergebnis anzeigen.
--
--		pr_nr	pr_name	m_nr	m_name	aufgabe			abt_name
--		p1  	Apollo	29346	Probst	Sachbearbeiter	Diagnose
--		p1  	Apollo	28559	Mozer	NULL			Beratung
--		p1  	Apollo	10102	Huber	Projektleiter	Freigabe
--		...
SELECT a.pr_nr,pr_name, m.m_nr,m_name,aufgabe,abt_name
FROM Arbeiten a
	LEFT JOIN Projekt p 
		ON p.pr_nr=a.pr_nr
	LEFT JOIN Mitarbeiter m 
		ON a.m_nr=m.m_nr
	LEFT JOIN Abteilung ab
		ON ab.abt_nr=m.abt_nr
ORDER BY pr_nr , m.m_nr DESC;


-- Aufgabe 2.5
--
-- Finden Sie Namen und Vornamen aller Mitarbeiter, 
-- die im Projekt Merkur arbeiten.
--
--		m_name		m_vorname
--		Kaufmann	Brigitte            
--		Meier		Rainer              
--		Huber		Petra               
SELECT m_name,m_vorname
FROM Mitarbeiter m
	LEFT JOIN Arbeiten a
		ON m.m_nr=a.m_nr
	LEFT JOIN Projekt p
		ON a.pr_nr=p.pr_nr
WHERE pr_name='Merkur'

-- Aufgabe 2.6
--
-- Nennen Sie Namen und Vornamen aller Projektleiter, deren 
-- Abteilung den Standort München hat.
--
--		m_name		m_vorname
--		Kaufmann	Brigitte            
SELECT m_name,m_vorname
FROM Mitarbeiter m
	LEFT JOIN Arbeiten a
		ON M.m_nr=a.m_nr
	LEFT JOIN Abteilung ab
		ON m.abt_nr=ab.abt_nr
WHERE stadt='München' AND aufgabe='Projektleiter'

-- Aufgabe 2.7
--
-- Nennen Sie einmalig die Namen der Projekte, in denen die 
-- Mitarbeiter arbeiten, die ein Gehalt von mindestens 
-- 5.000 € beziehen.
--
--		pr_name
--		Apollo
--		Gemini
SELECT DISTINCT pr_name
FROM Projekt p
	LEFT JOIN Arbeiten a
		ON p.pr_nr=a.pr_nr
	LEFT JOIN Mitarbeiter m
		ON a.m_nr=m.m_nr
	LEFT JOIN Gehalt g
		ON g.m_nr=m.m_nr
WHERE gehalt>= 5000

-- Aufgabe 2.8
--
-- Finden Sie die Mitarbeiter, die das gleiche Gehalt
-- beziehen. Geben Sie die Personalnummer und das Gehalt
-- einmalig aus.
--
--		m_nr	gehalt
--		2581	3000,00
--		18316	3000,00
SELECT g1.m_nr,g1.gehalt
FROM Gehalt g1,Gehalt g2
WHERE g1.gehalt = g2.gehalt AND g1.m_nr<>g2.m_nr


-- Aufgabe 2.9
--
-- Finden Sie die Personalnummer, die Projektnummer
-- und die Aufgabe von Mitarbeitern aus, die die gleiche 
-- Aufgabe im gleichen Projekt ausführen.
--
--		m_nr	pr_nr	aufgabe
--		25348	p2  	Sachbearbeiter
--		28559	p2  	Sachbearbeiter
SELECT a1.m_nr,a1.aufgabe
FROM Arbeiten a1,Arbeiten a2
WHERE a1.aufgabe = a2.aufgabe AND a1.m_nr<>a2.m_nr AND a1.pr_nr=a2.pr_nr


-- Aufgabe 2.10
--
-- Zeigen Sie alle Mitarbeiter der Abteilung 'a2' mit 
-- Personalnummer und Name an und geben Sie dazu die vom 
-- Mitarbeiter getätigten Umsätze aus. Hat der Mitarbeiter 
-- noch keine Umsätze getätigt, soll in der Spalte Umsatz 
-- eine 0 angezeigt werden.
--
--		m_nr	m_name		umsatz
--		2581	Kaufmann	100000
--		9031	Meier		0
--		29346	Probst		0

SELECT m.m_nr,m_name,ISNULL(umsatz,0) AS umsatz
FROM Mitarbeiter m
	 LEFT JOIN Umsatz u
		ON m.m_nr=u.m_nr
WHERE m.abt_nr='a2'



-- Aufgabe 2.11
--
-- Verändern Sie die Abfrage aus Aufgabe 2.10, indem Sie
-- jetzt alle Mitarbeiter anzeigen. Gruppieren Sie über
-- die Personalnummer und den Namen und geben Sie die Summe
-- der getätigten Umsätze aus. Wenn keine Umsätze getätigt
-- wurden, soll weiterhin eine 0 erscheinen.
--
--		m_nr	m_name		umsatz
--		2581	Kaufmann	100000
--		9031	Meier		0
--		10102	Huber		18501
--		18316	Müller		0
--		25348	Keller		187665
--		28559	Mozer		0
--		29346	Probst		0
SELECT m.m_nr,m_name,ISNULL(SUM(umsatz),0) AS umsatz
FROM Mitarbeiter m
	 LEFT JOIN Umsatz u
		ON m.m_nr=u.m_nr 
GROUP BY m.m_nr,m.m_name


-- Aufgabe 2.12
--
-- Verändern Sie die Abfrage aus Aufgabe 2.11, indem Sie
-- nur die Mitarbeiter anzeigen, die noch keine Umsätze 
-- getätigt haben.
--
--		m_nr	m_name	umsatz
--		9031	Meier	0
--		18316	Müller	0
--		28559	Mozer	0
--		29346	Probst	0
SELECT m.m_nr,m_name,ISNULL(SUM(umsatz),0) AS umsatz
FROM Mitarbeiter m
	 LEFT JOIN Umsatz u
		ON m.m_nr=u.m_nr 
GROUP BY m.m_nr,m.m_name
HAVING SUM(umsatz) IS NULL


-- Aufgabe 2.13
--
-- Finden Sie alle Mitarbeiter mit Personalnummer und
-- Namen, die in keinem Projekt als Sachbearbeiter tätig sind.
--
--		m_nr	m_name
--		2581	Kaufmann
--		10102	Huber
--		18316	Müller


SELECT  m_nr,m_name
FROM Mitarbeiter 
WHERE m_nr NOT IN (SELECT m_nr
					FROM  Arbeiten
					WHERE aufgabe='Sachbearbeiter')

