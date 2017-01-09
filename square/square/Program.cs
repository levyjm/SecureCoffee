using System.Drawing;
using System;

namespace square
{
	class MainClass
	{
		public static void Main(string[] args)
		{

			Rectangle rect1 = new Rectangle(-3.5, 4, 4.5, -3);
			Rectangle rect2 = new Rectangle(4, 4, 2, 2);

			rect1.IntersectsWith(rect2);

			System.Console.Write("test");

			Rectangle final = Rectangle.Intersect(rect1, rect2);

			string rectString = final.ToString();

			System.Console.Write(rectString);

		}
	}
}
