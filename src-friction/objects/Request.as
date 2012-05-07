package objects {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class Request extends MovieClip {
		private const showTime:Number = 1000;
		public var timer:Timer;
		public var isAdded:Boolean = false;
		
		public function Request() {
			stop();
			
			this.x = 0;
			this.y = -200;
			timer = new Timer(this.showTime, 1);
			
			this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler, false, 0, true);
			this.addEventListener(Event.ADDED_TO_STAGE, addHandler, false, 0, true);
		}
		
		private function addHandler(e:Event):void {
			//this.removeEventListener(Event.ADDED_TO_STAGE, addHandler);
			this.timer.start();
			this.isAdded = true;
			trace("added");
		}
		
		private function completeHandler(e:TimerEvent):void {
			//this.parent.removeChild(this);
			this.isAdded = false;
			this.parent.removeChild(this);
		}
	}
	
}
