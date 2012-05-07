package objects {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Box extends MovieClip {
		private var boxX:Number = 0;
		private var boxY:Number = 0;
		public function get getLocatX():Number { return boxX; };
		public function get getLocatY():Number { return boxY; };
		
		private var speedX:Number = 0;
		private var speedY:Number = 0;
		public function get getSpeedX():Number { return speedX; };
		public function get getSpeedY():Number { return speedY; };
		private var accX:Number = 0;
		private var accY:Number = 0;
		private var weight:Number = 25;
		private var force:Number = 0;
		/*
		 * frictionMove:動摩擦力
		 * frictionValeMove:動摩擦係數
		 */
		private var myfricton:Number = 0;
		private var frictionMove:Number = 0;
		private var frictionStatic:Number = 0;
		private var frictionValueStatic:Number = 0;
		private var frictionValueMove:Number = 0;
		
		public var isMove:Boolean = false;
		public var moveWide:Number = 645;
		public var moveScale:Number = 1;
		
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
				if (x < moveWide)
				{
					speedX += accX;
					speedY += accY;
					
					this.x += speedX * moveScale;
					this.y += speedY * moveScale;
				}
				else {
					this.moveDisable();
					this.reset();
				}
			}
		}
		
		public function setWeight(w:Number):void {
				this.weight = w;
		}
		
		public function setForce(f:Number):void {
				this.force = f;
		}
		
		public function moveEnable():void {
			this.isMove = true;
			this.gotoAndStop((this.currentFrame + 1));
		}
		
		public function moveDisable():void {
			this.isMove = false;
			this.gotoAndStop((this.currentFrame - 1));
		}
		
		public function setFrictionForce():void {
			frictionMove = frictionValueMove * weight;
			frictionStatic = frictionValueStatic * weight;
			trace("set force"+ frictionMove +" static:"+ frictionStatic);
		}
		
		public function setFrictionValue(m:Number, s:Number):void {
			frictionValueMove = m;
			frictionValueStatic = s;
			trace("set force value"+ m+ s);
		}
		
		public function setAcceleration():void {
			if (force < frictionStatic)
			{
				if (this.speedX <= 0)
				{
					this.frictionStatic = force;
					accX = 0;
				}
				else if (this.speedX > 0)
				{
					accX = (force - frictionMove) / weight;
				}
			}
			else {
				this.frictionStatic = this.frictionMove;
				accX = (force - frictionMove) / weight;
			}
			trace("acc: "+accX);
		}
	}
	
}
