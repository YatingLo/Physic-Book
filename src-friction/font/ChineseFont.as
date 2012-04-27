package font 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author yatinglo
	 */
	public class ChineseFont extends Sprite
	{
		
		public function ChineseFont() 
		{
			[Embed(systemFont="微軟正黑體", fontName = "ChineseFont")]
			public static var ChineseFontClass:Class;
			Font.registerFont(ChineseFontClass);
		}
		
	}

}