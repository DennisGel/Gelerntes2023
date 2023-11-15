USE master;
GO
DROP DATABASE IF EXISTS Projekt;
GO
CREATE DATABASE Projekt;
GO
USE Projekt
GO
--Erstellen der Tabelle Abteilung
CREATE TABLE Abteilung(
	abt_nr CHAR(4) NOT NULL,
	abt_name CHAR(20) NOT NULL,
	stadt CHAR(15),
	CONSTRAINT pk_Abteilung 
		PRIMARY KEY(abt_nr)
);
--Erstellen der Tabelle Projekt
CREATE TABLE Projekt(
	pr_nr CHAR(4) NOT NULL,
	pr_name CHAR(25),
	Mittel FLOAT,
	CONSTRAINT pk_Projekt 
		PRIMARY KEY (pr_nr)
);
--Erstellen der Tabelle Mitarbeiter
CREATE TABLE Mitarbeiter(
	m_nr INT NOT NULL,
	m_vorname CHAR(20) NOT NULL,
	m_name CHAR(20) NOT NULL,
	abt_nr CHAR(4)
	CONSTRAINT pk_Mitarbeiter
		PRIMARY KEY (m_nr)
	CONSTRAINT fk_Mitarbeiter_Abteilung 
		FOREIGN KEY (abt_nr) 
		REFERENCES Abteilung(abt_nr)
);
--Erstellen der Assoziationstabelle Arbeiten zwischen Mitarbeiter und Projekt
CREATE TABLE  Arbeiten(
	m_nr INT NOT NULL,	
	pr_nr CHAR(4) NOT NULL,
	aufgabe CHAR(20),
	einst_dat DATE,
	CONSTRAINT pk_Arbeiten 
		PRIMARY KEY (m_nr, pr_nr), 
	CONSTRAINT fk_Arbeiten_Mitarbeiter 
		FOREIGN KEY (m_nr) 
		REFERENCES Mitarbeiter(m_nr),
	CONSTRAINT fk_Arbeiten_Projekt 
		FOREIGN KEY (pr_nr) 
		REFERENCES Projekt(pr_nr)
);
GO
--Werte in Projekt einfügen
INSERT INTO Projekt (pr_nr, pr_name, Mittel)
VALUES	('p1','Apollo',120000),
		('p2','Gemini',95000),
		('p3','Merkur',186500);

--Abfrage der Daten Aus Projekt
--SELECT * FROM Projekt

--Werte in Abteilung einfügen
INSERT INTO Abteilung(abt_nr, abt_name, stadt)
VALUES	('a1','Beratung','München'),
		('a2','Diagnose','München'),
		('a3','Freigabe','Stuttgart');

--Abfrage der Daten aus Abteilung
--SELECT * FROM Abteilung

--Werte in Mitarbeiter einpflegen
INSERT INTO Mitarbeiter (m_nr,m_name,m_vorname,abt_nr)
VALUES	(25348,'Keller','Hans','a3'),
		(10102,'Huber','Petra','a3'),
		(18316,'Müller','Gabriela','a1'),
		(29346,'Probst','Andreas','a2'),
		(9031,'Meier','Rainer','a2'),
		(2581,'Kaufmann','Brigitte','a2'),
		(28559,'Mozer','Sibille','a1');

--Abfrage der Daten aus Mitarbeiter
--SELECT * FROM Mitarbeiter

--Werte in die Assoziationstabelle "Arbeiten" einpflegen
INSERT INTO Arbeiten (m_nr,pr_nr,aufgabe,einst_dat)
VALUES	(10102,'p1','Projektleiter','2014-09-30'),
		(10102,'p3','Gruppenleiter','2014-12-31'),
		(25348,'p2','Sachbearbeiter','2014-02-14'),
		(18316,'p2',NULL,'2015-05-31'),
		(29346,'p2',NULL,'2013-12-14'),
		(2581,'p3','Projektleiter','2013-10-14'),
		(9031,'p1','Gruppenleiter','2015-04-14'),
		(28559,'p1',NULL,'2015-04-14'),
		(28559,'p2','Sachbearbeiter','2014-01-31'),
		(9031,'p3','Sachbearbeiter','2014-11-14'),
		(29346,'p1','Sachbearbeiter','2015-03-31');
GO
ALTER TABLE Mitarbeiter
ADD wohnort CHAR(25) NULL;
GO
UPDATE Mitarbeiter SET wohnort = 'München' WHERE m_name='Keller';
UPDATE Mitarbeiter SET wohnort = 'Landshut' WHERE m_name='Huber';
UPDATE Mitarbeiter SET wohnort = 'Rosenheim' WHERE m_name='Müller';
UPDATE Mitarbeiter SET wohnort = 'Augsburg' WHERE m_name='Probst';
UPDATE Mitarbeiter SET wohnort = NULL WHERE m_name='Meier';
UPDATE Mitarbeiter SET wohnort = NULL WHERE m_name='Kaufmann';
UPDATE Mitarbeiter SET wohnort = 'Ulm' WHERE m_name='Mozer';
GO
CREATE TABLE Umsatz(
umsatz_nr INT NOT NULL,
m_nr INT NOT NULL,
datum DATE NOT NULL,
umsatz FLOAT NOT NULL,
CONSTRAINT PK_Umsatz
	PRIMARY KEY (umsatz_nr),
CONSTRAINT FK_Umsatz_Mitarbeiter
	FOREIGN KEY (m_nr)
	REFERENCES Mitarbeiter(m_nr)
);
GO
INSERT INTO Umsatz
VALUES (1 ,10102, '20141001' ,500),
	   (2 ,10102, '20141002' ,500),
	   (3 ,10102, '20141101' ,500),
	   (4 ,10102, '20141101' ,5000),
	   (5 ,10102, '20141102' ,500),
	   (6 ,10102, '20141209' ,500),
	   (7 ,10102, '20141210' ,500),
	   (8 ,10102, '20141223', 5000),
	   (9 ,10102, '20141228', 500),
	   (10,10102, '20150101', 5001),
	   (11,25348, '20140215', 1500),
	   (12,25348, '20140216', 1500),
	   (13,25348, '20140217', 1500),
	   (14,25348, '20140501', 1500),
	   (15,25348, '20140502', 15000),
	   (16,25348, '20141011', 15000),
	   (17,25348, '20150201', 150000),
	   (18,25348, '20150301', 1500),
	   (19,25348, '20150401', 15),
	   (20,25348, '20150501', 150),
	   (21,2581 , '20151101', 100000);
GO
CREATE TABLE Gehalt(
gehalt_id INT IDENTITY(1,1),
gehalt MONEY NOT NULL,
m_nr INT UNIQUE NOT NULL,
CONSTRAINT PK_Gehalt
	PRIMARY KEY(gehalt_id),
CONSTRAINT FK_Gehalt_Mitarbeiter
	FOREIGN KEY(m_nr)
	REFERENCES Mitarbeiter(m_nr)
);
GO
INSERT INTO Gehalt (m_nr,gehalt)
VALUES
  (2581  ,     3000	),
  (9031  ,     4000	),
  (10102 ,     3500	),
  (18316 ,     3000	),
  (25348 ,     1000	),
  (28559 ,     6000	),
  (29346 ,     5000	);
