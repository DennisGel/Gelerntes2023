namespace MonkeyIsland
{
	public class Beach : Location
	{
		public Ship Schiff { get; set; }
		public Island Insel { get; set; }

		public Beach(string name)
		{
			Name = name;
		}

		public bool TakeShip(Ship schiff)
		{
			Schiff = schiff;
			return true;
		}
		public bool KickShip(Ship schiff)
		{
			if (Schiff == schiff)
			{
				Schiff = null; return true;
			}
			else { return false; }
		}
		public void ShowPirate()
		{
			Console.WriteLine(Pirat.Name);
		}
	}
}
