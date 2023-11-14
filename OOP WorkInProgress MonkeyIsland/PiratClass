namespace MonkeyIsland
{
	public class Pirat
	{
		public string Name { get; set; }
		public Ship Schiff { get; set; }
		public Island Insel { get; set; }
		public Beach Strand { get; set; }
		public Sea Meer { get; set; }
		public Pub Kneipe { get; set; }

		//Konstruktor
		public Pirat(string name, Island insel, Beach strand)
		{
			Name = name;
			Insel = insel;
			Strand = strand;
		}
		public bool GoToPub(Pub kneipe)
		{
			Kneipe = kneipe;
			return true;
		}
		public bool GoToBeach(Beach strand)
		{
			Strand = strand;
			return true;
		}
		public bool GoInShip(Ship schiff)
		{
			Schiff = schiff;
			return true;
		}
		public void WhereAmI()
		{
			if (Kneipe != null)
			{ Console.WriteLine(Kneipe.Name); }
			else if (Strand != null)
			{ Console.WriteLine(Strand.Name); }
			else { Console.WriteLine(Meer.Name); }
		}
	}
}
