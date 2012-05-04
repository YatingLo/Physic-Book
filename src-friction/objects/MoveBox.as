package objects {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextFormat;
	
	import objects.Floor;
	import objects.ScrollBar;
	
	public class MoveBox extends MovieClip {
		public var forcebar:ScrollBar;
		public var moveAble:Boolean;
		public var outStage:Boolean;
		
		private var boxX:Number = 0;
		private var boxY:Number = 0;
		
		private var weight:Number;
		public function get getWeight():Number { return weight; };
		private var maxWeight:Number = 50;
		private var minWeight:Number = 5;
		
		private var force:Number;
		public function get getForce():Number { return force; };
		
		private var frictionStatic:Number = 0;
		public function get getFrictionMax():Number { return frictionStatic; };
		
		private var frictionMove:Number = 0;
		public function get getFrictionMove():Number { return frictionMove; };
		
		private var myfriction:Number = 0;
		private var acceleration:Number = 0;
		public function get getAcceleration():Number { return acceleration; };
		
		private var speed:Number;
		private var frictionValueStatic:Number;
		private var frictionValueMove:Number;
		
		private var formate:TextFormat = new TextFormat();
		
		public function MoveBox() {
			stop();
			init();
		}
		
		public function init() {
			this.speed = 0;
			force = 25;
			weight = 25;
			//紀錄原始位置
			this.addEventListener(Event.ADDED_TO_STAGE, addStageHandler, false, 0, true);
			
			//設定計算動靜摩擦力
			this.setFrictionValue(Floor.IRONMOVE, Floor.IRONSTATIC);
			
			this.forcebar.setForceNum();
		}
		
		public function stateReset(){
			this.speed = 0;
			this.x = boxX;
			this.y = boxY;
			
			this.forcebar.visible = true;
			moveAble = false;
			outStage = false;
		}
		
		public function movement():void {
			if (moveAble)
			{
				this.stateMove();
				if (this.x > 1200)
				{
					moveAble = false;
					outStage = true;
				}
				if (speed < 0)
				{
					moveAble = false;
				}
			}
			if(!moveAble) {
				stateStop();
			}
		}
		
		public function setWeight(w:Number):void {
				this.weight = w;
		}
		
		public function weightUp():void {
			if( weight < maxWeight)
				weight += 5;
		}
		
		public function weightDown():void {
			if( weight > minWeight)
				weight -= 5;
		}
		
		public function stateStop():void {
		}
		
		public function stateMove():void {
			this.speed += (acceleration/60);
			this.x += speed;
		}
		
		public function moveEnabled():void {
			this.forcebar.visible = false;
			this.gotoAndStop(2);
			this.force = this.forcebar.getForceNum();
			this.setFrictionForce();
			this.setAcceleration();
			this.moveAble = true;
			trace(this.forcebar.getForceNum());
			trace("acceleration:"+this.acceleration+"force:"+this.force);
		}
		
		public function moveDisabled():void {
			this.moveAble = false;
			this.forcebar.visible = true;
			this.gotoAndStop(1);
		}
		
		public function setFloorType(type:int):void {
			switch (type) 
			{
				case 1:
					setFrictionValue(Floor.IRONMOVE, Floor.IRONSTATIC);
				break;
				case 2:
					setFrictionValue(Floor.WOODMOVE, Floor.WOODSTATIC);
				break;
				case 3:
					setFrictionValue(Floor.SANDMOVE, Floor.SANDSTATIC);
				break;
			}
		}
		
		public function setFrictionForce():void {
			frictionMove = frictionValueMove * weight;
			frictionStatic = frictionValueStatic * weight;
			trace("move:" + this.frictionValueMove + "   Static:" + this.frictionValueStatic + "   weight:" + this.weight);
			trace("frictionMove:"+ frictionMove +" frictionStatic:"+ frictionStatic);
		}
		
		public function setFrictionValue(m:Number, s:Number):void {
			frictionValueMove = m;
			frictionValueStatic = s;
		}
		
		public function setAcceleration():void {
			if (speed > 0)
			{
				myfriction = this.frictionMove;
			}
			else
			{
				if (force > this.frictionStatic)
				{
					myfriction = this.frictionMove;
				}
				else
				{
					myfriction = force;
				}
			}
			acceleration = (force - this.myfriction) / weight;
		}
		
		function addStageHandler(e:Event):void {	
			this.boxX = x;
			this.boxY = y;
			this.removeEventListener(Event.ADDED_TO_STAGE, addStageHandler);
		}
	}
	
}
