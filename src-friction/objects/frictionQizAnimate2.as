package objects {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class frictionQizAnimate2 extends MovieClip {
		
		public var box:MoveBox;
		public var btn_play:SimpleButton;
		
		public function frictionQizAnimate2() {
			btn_play.addEventListener(MouseEvent.CLICK, playHandler, false, 0, true);
			this.addEventListener(Event.ENTER_FRAME, updateHandler, false, 0, true);
			
			this.box.setWeight(100);
			this.box.setFrictionValue(0.25, 0.3);
		}
		
		private function playHandler(e:Event):void {
			if (!box.moveAble)
			{
				this.box.moveEnabled();
			}
			else {
				this.box.moveDisabled();
				this.box.stateReset();
			}
		}
		
		private function updateHandler(e:Event):void {
			this.box.movement();
		}
	}
}
