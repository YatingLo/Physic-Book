package objects {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Box extends MovieClip {
		private var boxX:Number = 0;
		private var boxY:Number = 0;
		
		private var speedX:Number = 0;
		private var speedY:Number = 0;
		private var accX:Number = 0;
		private var accY:Number = 0;
		
		private var isMove:Boolean = false;
		
		public function Box() {
			stop();
			this.addEventListener(Event.ADDED_TO_STAGE, addStageHandler, false, 0, true);
		}
		
		function addStageHandler(e:Event):void {	
			this.boxX = x;
			this.boxY = y;
			this.removeEventListener(Event.ADDED_TO_STAGE, addStageHandler);
		}
		
		public function setSpeed(sx:Number, sy:Number):void {
			this.speedX = sx;
			this.speedY = sy;
		}
		
		public function setAcc(sx:Number, sy:Number):void {
			this.accX = sx;
			this.accY = sy;
		}
		
		public function reset():void {
			speedX = 0;
			speedY = 0;
				
			this.x = boxX;
			this.y = boxY;
		}
		
		public function move():void {
			if(isMove){
				if (x < 645)
				{
					speedX += accX;
					speedY += accY;
					
					this.x += speedX;
					this.y += speedY;
				}
				else {
					this.moveDisable();
					this.reset();
				}
			}
		}
		
		public function moveEnable():void {
			this.isMove = true;
			this.gotoAndStop((this.currentFrame + 1));
		}
		
		public function moveDisable():void {
			this.isMove = false;
			this.gotoAndStop((this.currentFrame - 1));
		}
	}
	
}
