using Bank;
using PPL_Class;
using Tests;

namespace Bank_Class
{
	public class BankInstitude
	{
		public Bankaccount[] Accounts = new Bankaccount[100];
		private int IDNextAccount = 0;

		public Bankaccount GetBankaccount(int y)
		{ return Accounts[y]; }

		public Bankaccount login()
		{
			int indexer;
			while (true)
			{
				Console.WriteLine("Bitte Kontonummer angeben");
				indexer = Test.TestInt();
				if (Accounts[indexer - 1] != null)
				{ break; }
			}
			while (true)
			{
				Console.WriteLine("Bitte PIN eingeben ");
				string pin = Test.TestString();
				if (Accounts[indexer].GetPIN() == pin)
				{ break; }
			}
			return Accounts[indexer];
		}
		public Bankaccount AddAccount()
		{

			Console.WriteLine("Bitte Vorname eingeben");
			string firstName = Test.TestString();
			Console.WriteLine("Bitte Nachname eingeben");
			string lastName = Test.TestString();
			string pin;

			while (true)
			{
				Console.WriteLine("Bitte Pin eingeben");
				pin = Test.TestString();
				Console.WriteLine("Bitte Pin bestätigen");
				string pin2 = Test.TestString();
				if (pin == pin2)
				{ break; }
				else { Console.WriteLine("PIN stimmt nicht überein"); }
			}

			People user = new People(firstName, lastName);
			Bankaccount NAcc = new Bankaccount(user, pin);
			NAcc.AccountInfo();

			Accounts[IDNextAccount] = NAcc;
			IDNextAccount++;
			return NAcc;
		}
	}
}
