﻿package objects {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class SlopeBox extends MovieClip {
		
		public var box:Box;
		public var arrow:MovieClip;
		private var arrowX:Number;
		private var arrowY:Number;
		
		public function SlopeBox() {
			stop();
			this.box.setFrictionValue(0.3, 0.3);
			this.box.setWeight(25);
			this.box.moveWide = 1600;
			this.box.moveScale = 0.1;
			this.addEventListener(Event.ENTER_FRAME, updateHandler, false, 0, true);
		}
		
		private function updateHandler(e:Event):void {
			this.box.move();
			this.arrow.x += this.box.getSpeedX * this.box.moveScale;
			if (this.box.x >= this.box.moveWide)
			{
				this.reset();
				this.box.moveDisable();
			}
		}
		
		public function loadArrowLocation():void {
			arrowX = this.arrow.x;
			arrowY = this.arrow.y;
		}
		
		public function reset():void {
			this.box.reset();
			this.arrow.x = arrowX;
			this.arrow.y = arrowY;
		}
		
	}
	
}