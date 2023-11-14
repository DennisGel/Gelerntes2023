namespace MonkeyIsland
{
	public class Location
	{
		public Pirat Pirat { get; set; }
		public string Name { get; set; }

		public bool PickPirat(Pirat pirat)
		{
			Pirat = pirat;
			return true;
		}
		public bool KickPirat()
		{
			Pirat = null;
			return true;
		}

	}
}
