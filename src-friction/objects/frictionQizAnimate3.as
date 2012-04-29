package objects {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class frictionQizAnimate3 extends MovieClip {
		
		public var btn_slope1:SimpleButton;
		public var btn_slope2:SimpleButton;
		public var btn_slope3:SimpleButton;
		//public var btn_play:SimpleButton;
		public var slopeBox:SlopeBox;
		
		public function frictionQizAnimate3() {
			stop();
			this.init();
		}
		
		private function init():void {
			this.btn_slope1.addEventListener(MouseEvent.CLICK, slopeOne, false, 0, true);
			this.btn_slope2.addEventListener(MouseEvent.CLICK, slopeTwo, false, 0, true);
			this.btn_slope3.addEventListener(MouseEvent.CLICK, slopeThree, false, 0, true);
			this.addEventListener(Event.ENTER_FRAME, enterFramHandler, false, 0, true);
			//this.btn_play.addEventListener(MouseEvent.CLICK, btnPlay, false, 0, true);
			this.slopeBox.box.setForce(30);
			this.slopeBox.box.setFrictionForce();
			this.slopeBox.box.setAcceleration();
			this.slopeBox.loadArrowLocation();
		}
		
		private function enterFramHandler(e:Event):void {
			this.slopeBox.updateHandler(e);
			if (this.slopeBox.box.x >= this.slopeBox.box.moveWide)
			{
				this.slopeBox.reset();
				this.slopeBox.box.moveDisable();
				this.buttonState(true);
			}
		}
		
		private function slopeOne(e:MouseEvent):void {
			this.gotoAndStop(3);
			this.slopeBox.gotoAndStop(3);
			this.slopeBox.box.setForce(70);
			this.slopeBox.box.setFrictionForce();
			this.slopeBox.box.setAcceleration();
			this.slopeBox.loadArrowLocation();
		}
		
		private function slopeTwo(e:MouseEvent):void {
			this.gotoAndStop(2);
			this.slopeBox.gotoAndStop(2);
			this.slopeBox.box.setForce(50);
			this.slopeBox.box.setFrictionForce();
			this.slopeBox.box.setAcceleration();
			this.slopeBox.loadArrowLocation();
		}
		
		private function slopeThree(e:MouseEvent):void {
			this.gotoAndStop(1);
			this.slopeBox.gotoAndStop(1);
			this.slopeBox.box.setForce(30);
			this.slopeBox.box.setFrictionForce();
			this.slopeBox.box.setAcceleration();
			this.slopeBox.loadArrowLocation();
		}
		
		
		public function move (e:MouseEvent):void {
			if (!this.slopeBox.box.isMove)
			{
				this.slopeBox.box.moveEnable();
				this.buttonState(false);
			}
			else {
				this.slopeBox.box.moveDisable();
				this.slopeBox.reset();
				this.buttonState(true);
			}
		}
		
		public function buttonState(state:Boolean):void {
			this.btn_slope1.enabled = state;
			this.btn_slope2.enabled = state;
			this.btn_slope3.enabled = state;
			this.btn_slope1.mouseEnabled = state;
			this.btn_slope2.mouseEnabled = state;
			this.btn_slope3.mouseEnabled = state;
		}
	}
	
}
