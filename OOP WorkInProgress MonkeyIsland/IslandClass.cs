namespace MonkeyIsland
{
	public class Island : Location
	{
		public Beach Strand { get; set; }
		public Pub Kneipe { get; set; }

		public Island(string name)
		{
			Name = name;
			Kneipe = new Pub(this);
			Strand = new Beach("Sunny");
		}
	}
}
