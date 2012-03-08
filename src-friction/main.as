package   {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.text.TextField;
	
	import objects.Floor;

	public class main extends MovieClip {
		
		public var floor:Floor;
		public var iron_btn:SimpleButton;
		public var wood_btn:SimpleButton;
		public var sand_btn:SimpleButton;
		public var forceup_btn:SimpleButton;
		public var forcedown_btn:SimpleButton;
		public var forcenum:TextField;
		public var box:MovieClip;
		
		public function main() {
			this.stop();
			floor.stop();
			box.stop();
			this.init();
		}
		
		public function init():void {
			iron_btn.addEventListener(TouchEvent.TOUCH_TAP, touchEventHandler);
			iron_btn.addEventListener(MouseEvent.CLICK, mouseEventHandler);
		}
		
		public function touchEventHandler(e:TouchEvent):void {
			//trace(e.currentTarget);
		}
		public function mouseEventHandler(e:MouseEvent):void {
			trace(e.toString());
			floor.gotoAndStop
		}
	}
	
}
