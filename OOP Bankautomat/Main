using Bank;
using Bank_Class;
using Menue_Class;
using Tests;

string currency()
{
	string output;
	Console.WriteLine("Welche Währung wollen Sie Einzahlen? Euro(EUR) | US-Dollar(USD)");
	while (true)
	{
		output = Test.TestString();
		if (output.ToUpper() == "USD" || output.ToUpper() == "EUR")
		{ break; }
	}
	return output;
}
//erstellen eines Bank Objektes
BankInstitude Sparkasse = new BankInstitude();

// Variablen deklaration
int choice = 0;
bool programmstart = false;
double amount;
string chosenCurrency;

Menus.welcomeScreen();
Menus.firstMenue();
choice = Test.TestInt();


// beim ersten mal im Programmablauf
//Nutzer erstellen und PIN festlegen

int count = 0;
if (choice != 7)
{
	if (count == 0)
	{
		Sparkasse.AddAccount();
		Thread.Sleep(1200);
	}
	Console.Clear();

	// Eingabe Wechselkurs

	Console.WriteLine("Bitte geben sie den Aktuellen Wechselkurs von EUR zu USD ein");
	double exchangerate = Test.TestDouble();
	Bankaccount.SetEuroToUsd(exchangerate);
}
// neues Konto dem Kontoarray hinzufügen
Bankaccount Acc = Sparkasse.GetBankaccount(0);

//Menüschleife
while (choice != 7)
{
	Menus.mainMenue();
	choice = Test.TestInt();

	switch (choice)
	{

		case 1:

			chosenCurrency = currency();
			Console.WriteLine("Bitte geben sie dein Einzuzahlenden Betrag ein");
			amount = Test.TestInt();
			double sum = Acc.AddMoney(chosenCurrency, amount);
			if (sum != 0)
			{
				Console.WriteLine($"Dem Konto wurden {sum}€ hinzugefügt");
			}
			Console.WriteLine(Acc.GetSaldo(chosenCurrency));
			break;
		case 2:
			chosenCurrency = currency();
			Console.WriteLine("Bitte geben sie dein Einzuzahlenden Betrag ein");
			amount = Test.TestInt();
			double take = Acc.TakeMoney(chosenCurrency, amount);
			if (take != 0)
			{
				Console.WriteLine($"Vom Konto wurden {take}€ abgezogen");
			}
			break;
		case 3:
			chosenCurrency = currency();
			Console.WriteLine($"der Kontostand beträgt: {Acc.GetSaldo(chosenCurrency):0.00}€");
			break;
		case 4:
			Acc.AccountInfo();
			break;
		case 7:
			programmstart = false;
			break;
		case 8:
			Console.WriteLine("Sie wurden Abgemeldet");
			Console.Clear();
			Thread.Sleep(800);
			Menus.logoutMenue();
			choice = Test.TestInt();
			switch (choice)
			{
				case 5:
					Sparkasse.AddAccount();
					Acc = Sparkasse.login();
					break;
				case 6:
					Acc = Sparkasse.login();
					break;
				case 7:
					programmstart = false;
					break;
			}
			break;
	}
	if (choice == 7)
	{ break; }
}