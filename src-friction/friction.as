package
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class friction extends MovieClip
	{
		public var btn_next:SimpleButton;
		
		public function friction()
		{
			stop();
			this.gotoAndStop(1);
			this.btn_next.addEventListener(MouseEvent.CLICK, goNext, false, 0, true);
		}
		
		public function goNext(e:MouseEvent):void {
			this.gotoAndStop(2);
		}
	}
}