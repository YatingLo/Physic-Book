package objects
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author yatinglo
	 */
	public class MyButton extends MovieClip
	{
		private var isShining:Boolean = false;
		private var play_num:int=0;
		private var play_timer:Timer = new Timer(300, 0);
		
		public function MyButton() 
		{
			super();
			stop();
			this.play_timer.addEventListener(TimerEvent.TIMER, this.ShinigPlay, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler, false, 0, true);
			this.ShiningEnabled();
		}
		
		public function mouseUpHandler(e:Event):void {
			if (isShining == true)
			{
				this.ShiningDisabled();
			}
		}
		
		public function ShiningEnabled():void {
			if (!this.isShining)
			{
				this.isShining = true;
				this.play_timer.start();
			}
		}
		
		public function ShiningDisabled():void {
			if (this.isShining)
			{
				this.isShining = false;
				this.play_timer.stop();
				this.gotoAndStop(1);
			}
		}
		
		private function ShinigPlay(e:Event):void {
			if (this.currentFrame == 2) { 
				this.gotoAndStop(1);
			}
			else if (this.currentFrame == 1) {
				this.gotoAndStop(2);
			}
		}
	}

}