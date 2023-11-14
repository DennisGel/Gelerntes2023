namespace Menue_Class
{
	internal class Menus
	{
		public static void welcomeScreen()
		{
			Console.WriteLine($"+----------Bank----------+");
			Console.WriteLine($"|                        |");
			Console.WriteLine($"|       Herzlich         |");
			Console.WriteLine($"|      Willkommen        |");
			Console.WriteLine($"|                        |");
			Console.WriteLine($"+------------------------|");
			Thread.Sleep(800);
			Console.Clear();
		}
		public static void firstMenue()
		{
			Console.WriteLine($"+----------Bank----------+");
			Console.WriteLine($"|                        |");
			Console.WriteLine($"|       Herzlich         |");
			Console.WriteLine($"|      Willkommen        |");
			Console.WriteLine($"|                        |");
			Console.WriteLine($"+------------------------|");
			Console.WriteLine($"| Neues Konto anlegen(5) |");
			Console.WriteLine($"| Beenden            (7) |");
			Console.WriteLine($"+------------------------+");
		}
		public static void mainMenue()
		{
			Console.WriteLine($"+----------Bank----------+");
			Console.WriteLine($"| Einzahlung         (1) |");
			Console.WriteLine($"| Auszahlung         (2) |");
			Console.WriteLine($"| Kontostand         (3) |");
			Console.WriteLine($"| Kontoinformationen (4) |");
			Console.WriteLine($"+------------------------|");
			Console.WriteLine($"| Beenden            (7) |");
			Console.WriteLine($"| Abmelden           (8) |");
			Console.WriteLine($"+------------------------+");
		}
		public static void logoutMenue()
		{
			Console.WriteLine($"+----------Bank----------+");
			Console.WriteLine($"|                        |");
			Console.WriteLine($"|       Herzlich         |");
			Console.WriteLine($"|      Willkommen        |");
			Console.WriteLine($"|                        |");
			Console.WriteLine($"+------------------------|");
			Console.WriteLine($"| Neues Konto anlegen(5) |");
			Console.WriteLine($"| Anmelden           (6) |");
			Console.WriteLine($"| Beenden            (7) |");
			Console.WriteLine($"+------------------------+");
		}
	}
}
