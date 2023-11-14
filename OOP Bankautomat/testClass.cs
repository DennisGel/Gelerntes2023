namespace Tests
{
	static class Test
	{
		public static int TestInt()
		{
			int isInt;
			while (true)
			{
				try
				{
					isInt = Convert.ToInt32(Console.ReadLine());
					break;
				}
				catch
				{
					Console.WriteLine("Ungültige Eingabe!");
					continue;
				}
			}
			return isInt;
		}

		public static double TestDouble()
		{
			double isDouble;
			while (true)
			{
				try
				{
					isDouble = Convert.ToDouble(Console.ReadLine());
					break;
				}
				catch
				{
					Console.WriteLine("Ungültige Eingabe!");
					continue;
				}
			}
			return isDouble;
		}
		public static string TestString()
		{
			string? isString;
			while (true)
			{
				try
				{
					isString = Convert.ToString(Console.ReadLine());

					if (isString != null)
					{
						break;
					}
				}
				catch
				{
					Console.WriteLine("Ungültige Eingabe!");
					continue;
				}
			}
			return isString;
		}
		public static char TestChar()
		{
			char isChar;
			while (true)
			{
				try
				{
					isChar = Convert.ToChar(Console.ReadKey());
					break;
				}
				catch
				{
					Console.WriteLine("Ungültige Eingabe!");
					continue;
				}
			}
			return isChar;
		}
	}
}