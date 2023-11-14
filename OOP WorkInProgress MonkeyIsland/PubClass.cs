namespace MonkeyIsland
{
	public class Pub : Location
	{
		public Island Insel { get; set; }

		//Konstruktor
		public Pub(Island insel)
		{ Insel = insel; }

		//Methoden
		public void GrogServ()
		{
			Console.WriteLine("Willst nen Grog Bürschchen? ");
		}
		public void ShowPirate()
		{
			Console.WriteLine(Pirat.Name);
		}

	}
}
