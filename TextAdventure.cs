// Methode Die den Spielername Zurückgibt

static string playerName()
{
	Console.WriteLine("Dein Name?");
	string name = Console.ReadLine();
	return name;
}
// Methode zur Festlegung der Player werte
static int[] playerStats()
{
	int playerHealth;
	int playerStr;
	int playerLuck;
	int playerClass;
	do
	{
		Console.WriteLine("Dein Stärke Wert");
		playerStr = Convert.ToInt32(Console.ReadLine());
		Console.WriteLine("Dein Lebens Wert");
		playerHealth = Convert.ToInt32(Console.ReadLine());
		Console.WriteLine("Dein Glücks Wert");
		playerLuck = Convert.ToInt32(Console.ReadLine());
		if ((playerStr + playerLuck + playerHealth <= 15) && (playerHealth <= 10) && (playerLuck <= 10) && (playerStr <= 10))
		{
			break;
		}
	} while (true);
	playerClass = 5;
	int[] playerstats = { playerHealth, playerStr, playerLuck, playerClass };
	return playerstats;
}

// Methode zum Generieren von NPC-Gegnern
static int[] enemyStats()
{
	// Variablen Deklaration 
	int enemyHealth;
	int enemyStr;
	int enemyLuck;
	bool gesamt;

	// Schleife zum Generieren der Gegner Werte
	while (true)
	{
		// Erzeuge Random Zahlen für Gegner werte
		Random rand = new Random();
		enemyHealth = rand.Next(1, 8);
		Random rando = new Random();
		enemyStr = rando.Next(1, 8);
		Random random = new Random();
		enemyLuck = random.Next(1, 8);
		// Zusammen rechnen der Werte
		gesamt = ((enemyHealth + enemyLuck + enemyStr <= 15) && (enemyHealth + enemyLuck + enemyStr >= 12)) ? true : false;
		// Wenn Gegner Werte zwischen 15 und 12 Schleife beenden
		if (gesamt)
		{
			break;
		}
	}
	int[] enemystats = { enemyHealth, enemyStr, enemyLuck };
	return enemystats;
}
// Methode zum festlegender der range der Random Zahl für ein Krittreffer
static int kritChance(int luck)
{
	int prozent = 12;
	switch (luck)
	{
		case 1:
			prozent = 12;
			break;
		case 2:
			prozent = 11;
			break;
		case 3:
			prozent = 10;
			break;
		case 4:
			prozent = 9;
			break;
		case 5:
			prozent = 8;
			break;
		case 6:
			prozent = 7;
			break;
		case 7:
			prozent = 6;
			break;
		case 8:
			prozent = 5;
			break;
		case 9:
			prozent = 4;
			break;
		case 10:
			prozent = 3;
			break;
		default:
			prozent = 2;
			break;
	}
	return prozent;
}
static double damageCalc(double stdAtk, double kritAtk, int luck)
{
	double damageTaken;
	int prozent;
	int chance;

	prozent = kritChance(luck);
	Random random = new();
	chance = random.Next(1, prozent);
	damageTaken = (chance == 1) ? kritAtk : stdAtk;

	return damageTaken;
}
// Methode für den Kampf  zwischen Spieler und NPC
static int[] fightSequence(int amountPotion, string playerName, int[] playerStats, int[] enemyStats)
{
	int exp;
	double stdAtkPlayer = Convert.ToDouble(playerStats[1]) / 10;
	double kritAtkPlayer = stdAtkPlayer + (stdAtkPlayer + (Convert.ToDouble(playerStats[2]) / 10));
	double stdAtkEnemy = Convert.ToDouble(enemyStats[1]) / 10;
	double kritAtkEnemy = stdAtkEnemy + (stdAtkEnemy + (Convert.ToDouble(enemyStats[2]) / 10));
	double playerHealth = Convert.ToDouble(playerStats[0]);
	double enemyHealth = Convert.ToDouble(enemyStats[0]);
	int prozent;
	int chance;
	double damageTaken;
	int count = 1;
	int[] loot = { 0, 0 };
	int enemyPotion = 1;
	string input;

	while (true)
	{
		if (playerStats[3] == 3)
		{
			Console.WriteLine("Du hast den Gegner vergiftet");
			Thread.Sleep(100);
		}
		else if (playerStats[3] == 2)
		{
			Console.WriteLine("Deine Magie wirkt und der Boden unter deinem Gegner fängt an zu lodern");
			Thread.Sleep(100);
		}

		//Gegner Kampf beginnt
		Console.WriteLine("Der Gegner macht sich Kampfbereit");
		Thread.Sleep(100);
		// Ermittlung ob Krit oder nicht
		damageTaken = damageCalc(stdAtkEnemy, kritAtkEnemy, enemyStats[2]);
		playerHealth = playerHealth - damageTaken;
		Console.WriteLine($"Dir wurde Schaden in Höhe von: {damageTaken} zugefügt");
		Thread.Sleep(100);
		// Prüfen ob NPC gewonnen hat
		if (playerHealth <= 0)
		{
			Console.WriteLine($"Du hast Verloren und wirst Ohnmächtig");
			break;
		}


		// Spieler Kampf beginnt
		Console.WriteLine("Du gehst in Kampfstellung");
		Thread.Sleep(100);
		// Ermittlung ob Krit oder nicht
		damageTaken = damageCalc(stdAtkPlayer, kritAtkPlayer, playerStats[2]);
		if (playerStats[3] == 3)
		{
			damageTaken = damageTaken + (enemyHealth / 100);
		}
		else if (playerStats[3] == 2)
		{
			damageTaken = damageTaken + ((enemyHealth / 100) * (playerStats[1] / 2));
		}
		enemyHealth = enemyHealth - damageTaken;

		Console.WriteLine($"Du hast dem Gegner Schaden in Höhe von: {damageTaken} zugefügt");
		// Prüfen ob Spieler gewonnen hat
		Thread.Sleep(100);
		if (enemyHealth <= 0)
		{
			exp = enemyStats.Sum();
			Console.WriteLine($"Du hast Gewonnen und {exp} Erfahrungspunkte erhalten");
			loot[0] = exp;
			Random rand = new();
			prozent = kritChance(playerStats[2]);
			chance = rand.Next(1, prozent);
			if (chance == 1)
			{
				Console.WriteLine("Du Glückspilz... Du hast einen Heiltrank gefunden");
				loot[1] = 1;
			}
			break;

		}
		// Zwischenstand
		Thread.Sleep(100);
		Console.WriteLine($"Ergebnis Runde {count}:");
		Thread.Sleep(100);
		Console.WriteLine($"Gesundheit {playerName}: {Math.Round(playerHealth, 2)}");
		Thread.Sleep(100);
		Console.WriteLine($"Gesundheit Gegner: {Math.Round(enemyHealth, 2)}");
		// Wenn Tränke vorhanden Spieler fragen ob er einen benutzen will
		if (amountPotion > 0)
		{
			Console.WriteLine($"Möchtest du einen Trank benutzen der 3 Gesundheit wiederherstellt Anzahl Tränke: {amountPotion} j=ja n=nein");
			input = Console.ReadLine();
			if (input != null)
			{
				if (input == "j")
				{
					playerHealth = playerHealth + 3;
				}
			}
		}
		// Wenn Gegner weniger als 3 Gesundheit hat Möglichkeit für Heiltrank
		if ((enemyPotion > 1) && (enemyHealth < 3))
		{
			Random ran = new();
			prozent = kritChance(playerStats[2]);
			chance = ran.Next(1, prozent);
			if (chance == 1)
			{
				Console.WriteLine("Der Gegner zieht einen Heiltrank aus der Tasche und Heilt sich um 3 Gesundheit");
				enemyPotion = enemyPotion - 1;
				enemyHealth = enemyHealth + 3;
			}

		}
		// Frage ob Spieler fliehen will
		Console.WriteLine("Willst du fliehen?");
		input = Console.ReadLine();
		if (input != null)
		{
			if (input == "j")
			{
				Console.WriteLine("Du lächerlicher Angsthase!!!");
				break;
			}
		}

	}
	return loot;
}
static int[] statIncrease(int[] playerStats)
{
	int input;
	Console.WriteLine("Du hast einen neuen Meilenstein erreicht nun darfst du einen deiner Werte um 1 erhöhen");
	while (true)
	{
		Console.WriteLine("Wähle für Gesundheit = 0 Stärke = 1 für Glück = 2");
		try
		{
			input = Convert.ToInt32(Console.ReadLine());
			if ((input >= 0) && (input < 3))
			{
				break;
			}
		}
		catch
		{
			Console.WriteLine("Ungültige Eingabe");
			Console.ReadLine();
		}
	}
	switch (input)
	{
		case 0:
			playerStats[0]++;
			break;
		case 1:
			playerStats[1]++;
			break;
		case 2:
			playerStats[2]++;
			break;
	}
	return playerStats;
}


static int[] classChange(int[] playerStats)
{
	int[] playerStatsClass;
	int input;
	string choise;

	Console.WriteLine("Endlich hast du Level 5 erreicht");
	Console.WriteLine("Nun ist es an der Zeit dich zu Spezialisieren");

	while (true)
	{
		while (true)
		{
			Console.WriteLine("Wähle dazu aus den Klassen: Krieger(1),Magier(2),Dieb(3)");
			try
			{
				input = Convert.ToInt32(Console.ReadLine());
				if ((input < 4) && (input > 0))
				{
					break;
				}
				else
				{
					Console.WriteLine("Ungültige Eingabe");
				}
			}
			catch
			{
				Console.WriteLine("Ungültige Eingabe");
				Console.ReadLine();
			}
		}
		switch (input)
		{
			case 1:
				Console.WriteLine("Der Krieger verfügt über einen höheren Stärke und Lebenswert");
				Console.WriteLine("ebenso kannst du dich zu beginn einer jeden Kampfrunde entscheiden Anzugreifen oder zu blocken");
				break;
			case 2:
				Console.WriteLine("Der Magier ist der Meister der Magie er fügt dem Gegner in jeder Runde prozentual von dessen Gesundheit basierend auf deinem Stärkewert Schaden zu");
				break;
			case 3:
				Console.WriteLine("Der Dieb hat einen höheren Glückswert vergiftet den Gegner zu beginn des Kampfes was ihn jede Runde 1% der aktuellen Gesundheit abzieht");
				break;
		}
		Console.WriteLine("Willst du diese Klasse wählen? ja=j nein=n");
		choise = Console.ReadLine();
		if (choise == "j")
		{
			switch (input)
			{
				case 1:
					playerStats[0] += 5;
					playerStats[1] += 5;
					playerStats[3] = 1;
					Console.WriteLine("Du bist jetzt ein Krieger");
					break;
				case 2:
					playerStats[3] = 2;
					Console.WriteLine("Du bist jetzt ein Magier");
					break;
				case 3:
					playerStats[2] += 3;
					playerStats[3] = 3;
					Console.WriteLine("Du bist jetzt ein Dieb");
					break;

			}
			break;
		}
		else if ((choise != "j") && (choise != "n"))
		{
			Console.WriteLine("Ungültige Eingabe");
		}
	}
	return playerStats;
}
// Hauptprogramm

string gamerName;
int[] pStats;
int[] eStats;
int[] loot;
int amountPotions = 1;
int experience = 0;
int level = 1;
int expToLvlUp;
int counter = 1;
string cheat;


Console.WriteLine("Hallo Abenteurer Willkommen in Astorsia");

gamerName = playerName();
pStats = playerStats();
while (true)
{
	eStats = enemyStats();
	if (counter % 10 == 0)
	{
		Console.WriteLine("Ein Boss ist erschienen. Sei Vorsichtig er ist mächtig");
		for (int i = 0; i < 3; i++)
		{
			eStats[i] += 3;
		}
	}
	loot = fightSequence(amountPotions, gamerName, pStats, eStats);
	experience = experience + loot[0];
	amountPotions = amountPotions + loot[1];
	counter++;
	Console.ReadLine();

	if (experience >= 100)
	{
		level++;
		experience = experience - 100;
		if (level % 2 == 0)
		{
			pStats = statIncrease(pStats);
		}
	}
	if ((level == 5) && (pStats[3] == 5))
	{
		pStats = classChange(pStats);
	}
	expToLvlUp = 100 - experience;
	Console.WriteLine($"Dein Level:{level} und {experience} Erfahrungspunkte");
	Console.WriteLine($"Bis zum nächsten LevelUp fehlen dir noch {expToLvlUp} Erfahrungspunkte");
	Console.WriteLine($"Menge Tränke: {amountPotions}");
	Console.ReadLine();
}
