namespace MonkeyIsland
{
	public class Ship : Location
	{
		public Sea Meer { get; set; }
		public Island Insel { get; set; }

		//Konstruktor
		public Ship(string name)
		{
			Name = name;
		}
		public bool ShiptoIsland(Island insel)
		{
			Insel = insel;
			return true;
		}
		public void WhereAmI()
		{
			Console.WriteLine((Insel == null) ? Meer.Name : Insel.Name);
		}
		public void ShowPirate()
		{
			Console.WriteLine(Pirat.Name);
		}
	}
}
