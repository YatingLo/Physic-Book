package objects {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class FrictionQizAnimate1 extends MovieClip {
		
		public var box:Box;
		public var btn_oil;
		public var btn_extend;
		public var btn_wheel;
		public var moveSpeed:TextField;
		
		private const speedExtend:Number = 0.01; 
		private const speedOil:Number = 0.05;
		private const speedWheel:Number = 0.1; 
		
		public function FrictionQizAnimate1() {
			this.addEventListener(Event.ENTER_FRAME, updateHandler,false, 0, true);
			this.btn_extend.addEventListener(MouseEvent.MOUSE_UP, moveWithExtend,false, 0, true);
			this.btn_oil.addEventListener(MouseEvent.MOUSE_UP, moveWithOil,false, 0, true);
			this.btn_wheel.addEventListener(MouseEvent.MOUSE_UP, moveWithWheel, false, 0, true);
			//this.btn_play.addEventListener(MouseEvent.MOUSE_UP, moveOrigine,false, 0, true);
		}
		
		private function updateHandler(e:Event):void {
			this.box.move();
		}
		
		private function moveWithExtend(e:MouseEvent):void {
			this.box.setAcc(speedExtend, 0);
			this.box.gotoAndStop("wide_static");
			this.box.reset();
			this.box.moveEnable();
		}
		
		private function moveWithOil(e:MouseEvent):void {
			this.box.setAcc(speedOil, 0);
			this.box.gotoAndStop("normal_static");
			this.box.reset();
			this.box.moveEnable();
		}
		
		private function moveWithWheel(e:MouseEvent):void {
			this.box.setAcc(speedWheel, 0);
			this.box.gotoAndStop("wheel_static");
			this.box.reset();
			this.box.moveEnable();
		}
		
		public function move (e:MouseEvent):void {
			this.box.setAcc(speedExtend, 0);
			this.box.gotoAndStop("normal_static");
			this.box.reset();
			this.box.moveEnable();
		}
	}
	
}
