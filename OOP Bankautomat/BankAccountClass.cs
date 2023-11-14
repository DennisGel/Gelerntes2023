using PPL_Class;

namespace Bank
{
	public class Bankaccount
	{
		// Non-Static Felder
		private int AccountNummber;
		private double Saldo;
		private People User;
		private string PIN;

		// Static Felder
		private static double EuroToUsd = 0;
		private static int AmountAccounts = 0;
		private static int NextAccountNummber = 1;

		public Bankaccount(People owner, string privateIdentifyNumb)
		{
			Saldo = 0;
			User = owner;
			// Nächste Kontonummer ist die K.nr des erstellten Objekts
			AccountNummber = NextAccountNummber;
			// Zählt NextAccountNummber hoch für das nächste Konto
			NextAccountNummber++;
			PIN = privateIdentifyNumb;
		}

		// Objekt-Getter
		public double GetSaldo(string input)
		{
			if (input.ToUpper() == "EUR")
			{
				return Saldo;
			}
			else if (input.ToUpper() == "USD")
			{
				return Saldo * EuroToUsd;
			}
			else
			{
				Console.WriteLine("Ungültige Eingabe");
				return 0;
			}
		}
		public string GetPIN() => PIN;

		//Klassen-Getter

		public static int GetAmountAccounts() => AmountAccounts;
		public static int GetNextAccountNummber() => NextAccountNummber;

		public static void GetEuroToUsd()
		{ Console.WriteLine(EuroToUsd); }

		//Klassen-Setter

		public static void SetEuroToUsd(double input)
		{
			EuroToUsd = Math.Round(input, 4);
		}

		//Public-Methoden

		public double AddMoney(string input, double wantToAdd)
		{
			if (wantToAdd > 0)
			{
				if (input.ToUpper() == "EUR")
				{
					Saldo += wantToAdd;
					return wantToAdd;
				}
				else if (input.ToUpper() == "USD")
				{
					Saldo += wantToAdd / EuroToUsd;
					return wantToAdd / EuroToUsd;
				}
				else
				{
					Console.WriteLine("Ungültige Währungs Eingabe");
					return 0;
				}
			}
			else { Console.WriteLine("Betrag zu gering."); return 0; }
		}

		public double TakeMoney(string input, double wantToTake)
		{
			if (Saldo >= wantToTake)
			{
				if (input.ToUpper() == "EUR")
				{
					Saldo -= wantToTake;
					return wantToTake;
				}
				else if (input.ToUpper() == "USD")
				{
					Saldo -= wantToTake / EuroToUsd;
					return wantToTake / EuroToUsd;
				}
				else
				{
					Console.WriteLine("Ungültige Währungs Eingabe");
					return 0;
				}
			}
			else { Console.WriteLine($"Nicht genügend Guthaben.Aktuelles Guthaben: {Saldo}"); return 0; }
		}
		public void AccountInfo()
		{
			Console.WriteLine($"+----------Bank----------+");
			Console.WriteLine($"|                        ");
			Console.WriteLine($"|Kontoinhaber: {User.GetFirstname()} {User.GetLastname()}");
			Console.WriteLine($"|Guthaben: {Saldo}  ");
			Console.WriteLine($"|Kontonummer: {AccountNummber}");
			Console.WriteLine($"+------------------------+");
		}
	}
}
