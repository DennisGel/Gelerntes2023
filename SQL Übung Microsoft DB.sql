---- Aufgaben
---- 1.Schreiben Sie bitte eine Abfrage, die die Spalten KundenId, BestellungId und Stadt 
---- zurückliefert. In einer weiteren Spalte soll partitioniert nach Stadt, die Summe der 
---- Frachtkosten je Stadt/Spanien und in einer weiteren Spalte, die Summe der Frachtkosten nach Spanien angezeigt werden. 
---- Ausgabe, wie unten:
--custid	orderid		city	FrachtStadtGesamt	Gesamt
--29	10366		Barcelona			37,98		861,89
--29	10426		Barcelona			37,98		861,89
--29	10568		Barcelona			37,98		861,89
--29	10887		Barcelona			37,98		861,89
--29	10928		Barcelona			37,98		861,89
--8		10970		Madrid				255,64		861,89
--8		10801		Madrid				255,64		861,89
--69	10281		Madrid				255,64		861,89
--69	10282		Madrid				255,64		861,89
--69	10306		Madrid				255,64		861,89
--8		10326		Madrid				255,64		861,89
--69	11013		Madrid				255,64		861,89
--69	10917		Madrid				255,64		861,89
--30	11037		Sevilla				568,27		861,89
--30	10303		Sevilla				568,27		861,89
--30	10629		Sevilla				568,27		861,89
--30	10550		Sevilla				568,27		861,89
--30	10872		Sevilla				568,27		861,89
--30	10874		Sevilla				568,27		861,89
--30	10888		Sevilla				568,27		861,89
--30	10911		Sevilla				568,27		861,89
--30	11009		Sevilla				568,27		861,89
--30	10948		Sevilla				568,27		861,89

SELECT custid,orderid,shipcity,SUM(freight)OVER(PARTITION BY shipcity) AS FrachtStadtGesamt
,SUM(freight)OVER() AS Gesamt
FROM Sales.Orders
WHERE shipcountry='spain'

----2. Schreiben Sie eine Abfrage, die die Summe der Bestellmenge je Stadt und die Gesamtmenge der Bestellungen
---- nach Deutschland als Resultset liefert.
---- Ausgabe, wie unten:
--orderid	productid	unitprice	custid	city	MengebyCity	Gesamtmenge
--10363			31			10			17	Aachen		160		9213
--10363			75			6,2			17	Aachen		160		9213
--10363			76			14,4		17	Aachen		160		9213
--10391			13			4,8			17	Aachen		160		9213
--10797			11			21			17	Aachen		160		9213
--10825			26			31,23		17	Aachen		160		9213
--10825			53			32,8		17	Aachen		160		9213
--11036			13			6			17	Aachen		160		9213
--11036			59			55			17	Aachen		160		9213
--11067			41			9,65		17	Aachen		160		9213
--10643			28			45,6		1	Berlin		174		9213
--10643			39			18			1	Berlin		174		9213
--10643			46			12			1	Berlin		174		9213
--10692			63			43,9		1	Berlin		174		9213

SELECT o.orderid,productid,unitprice,custid,shipcity,SUM(qty)OVER(PARTITION BY shipcity) AS MengebyCity
,SUM(qty)OVER() AS Gesamt
FROM Sales.Orders o
INNER JOIN Sales.OrderDetails od ON od.orderid=o.orderid
WHERE shipcountry='germany'

---- 3. Schreiben Sie eine Abfrage, die die Durchschnittspreise je Kunde und den Gesamtdurchschnitt
---- für Kunden aus Spanien / Madrid liefert.
---- Ausgabe, wie unten:
--orderid	productid	unitprice	custid	city	DurchschnittPbyKunde	Gesamtdurchschnitt
--10326			4			17,6		8	Madrid			34,865				21,424
--10326			57			15,6		8	Madrid			34,865				21,424
--10326			75			6,2			8	Madrid			34,865				21,424
--10801			17			39			8	Madrid			34,865				21,424
--10801			29			123,79		8	Madrid			34,865				21,424
--10970			52			7			8	Madrid			34,865				21,424
--10281			19			7,3			69	Madrid			15,6635				21,424
--10281			24			3,6			69	Madrid			15,6635				21,424
--10281			35			14,4		69	Madrid			15,6635				21,424
--10282			30			20,7		69	Madrid			15,6635				21,424
--10282			57			15,6		69	Madrid			15,6635				21,424
--10306			30			20,7		69	Madrid			15,6635				21,424
--10306			53			26,2		69	Madrid			15,6635				21,424
--10306			54			5,9			69	Madrid			15,6635				21,424
--10917			30			25,89		69	Madrid			15,6635				21,424
--10917			60			34			69	Madrid			15,6635				21,424
--11013			23			9			69	Madrid			15,6635				21,424
--11013			42			14			69	Madrid			15,6635				21,424
--11013			45			9,5			69	Madrid			15,6635				21,424
--11013			68			12,5		69	Madrid			15,6635				21,424

SELECT o.orderid,productid,unitprice,custid,shipcity,AVG(unitprice)OVER(PARTITION BY custid ORDER BY custid) AS DurchschnittbyKunde
,AVG(unitprice)OVER() AS Gesamtdurchschnitt
FROM Sales.Orders o
INNER JOIN Sales.OrderDetails od ON od.orderid=o.orderid
WHERE shipcity='madrid'

---- 4. Schreiben Sie eine Abfrage, die die Bestell-Daten zusammen mit deren Frachtkosten(freight) anzeigen.
---- In je einer weiteren Spalte zeigen Sie bitte das nächst niedrigere sowie das nächst höhere Frachtkosten an …
---- Ausgabe, wie unten:
--orderid	custid	shipperid	companyname			niedriger	hoeher
--10972			40		2		Customer EFFTC			NULL	0,12
--10296			46		1		Customer XPNIK			0,02	0,14
--10644			88		2		Customer SRQVM			0,12	0,15
--10509			6		1		Customer XHXJV			0,14	0,17
--11035			76		2		Customer SFOGW			0,15	0,2
--10415			36		1		Customer LVJSO			0,17	0,21
--10969			15		2		Customer JUWXK			0,2		0,33
--11054			12		1		Customer PSNMQ			0,21	0,4
--10322			58		3		Customer AHXHT			0,33	0,45
--10371			41		1		Customer XIIWM			0,4		0,48
--10586			66		1		Customer LHANT			0,45	0,53
--10883			48		3		Customer DVFMB			0,48	0,56
--10849			39		2		Customer GLLAG			0,53	0,56
--10307			48		2		Customer DVFMB			0,56	0,58
--10699			52		3		Customer PZNLA			0,56	0,59

SELECT o.orderid,custid,o.shipperid,companyname,
 LAG(freight)OVER(ORDER BY freight) AS nidriger
,LEAD(freight)OVER(ORDER BY freight) AS höher
FROM Sales.Orders o
INNER JOIN Sales.Shippers s  ON s.shipperid=o.shipperid


---- 5. Schreiben Sie eine Abfrage, die die Minimummenge und Maximummenge je Kunde jeweils in einer separaten
---- Spalte für Kunden aus USA Region OR liefert.
---- Ausgabe, wie unten:
--orderid	productid	unitprice	custid	city	region	MinimumbyKunde	MaximumbyKunde
--10528			11			21			32	Eugene		OR			2			30
--10528			33			2,5			32	Eugene		OR			2			30
--10528			72			34,8		32	Eugene		OR			2			30
--10589			35			18			32	Eugene		OR			2			30
--10616			38			263,5		32	Eugene		OR			2			30
--10616			56			38			32	Eugene		OR			2			30
--10616			70			15			32	Eugene		OR			2			30
--10616			71			21,5		32	Eugene		OR			2			30
--10617			59			55			32	Eugene		OR			2			30
--10656			14			23,25		32	Eugene		OR			2			30
--10656			44			19,45		32	Eugene		OR			2			30
--10656			47			9,5			32	Eugene		OR			2			30
--10681			19			9,2			32	Eugene		OR			2			30
--10681			21			10			32	Eugene		OR			2			30
--10681			64			33,25		32	Eugene		OR			2			30

SELECT o.orderid,productid,unitprice,custid,shipcity,shipregion,
	MIN(qty)OVER(PARTITION BY custid ORDER BY custid) AS MinimumbyKunde,
	MAX(qty)OVER(PARTITION BY custid) AS MaximumbyKunde
FROM Sales.Orders o
INNER JOIN Sales.OrderDetails od ON od.orderid=o.orderid
WHERE shipregion='or' AND shipcountry='USA'
