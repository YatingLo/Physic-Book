package objects
{
	import flash.display.MovieClip;
	
	public class ScrollBar extends MovieClip
	{
		private var scroller:MovieClip;
		private var scroll_area:MovieClip;
		
		public function ScrollBar()
		{
			super();
		}
		
		public function Enable():void
		{
			this.enabled = true;
			this.visible = true;
		}
		
		public function Disable():void
		{
			this.enabled = false;
			this.visible = false;
		}
	}
}