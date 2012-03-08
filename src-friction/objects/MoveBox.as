package objects {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class MoveBox extends MovieClip {
		public var moveAble:Boolean;
		private var floorType:int;
		
		private var weight:int;
		private var maxWeight:int = 50;
		private var minWeight:int = 5;
		private var force:int;
		private var frictionStatic:int;
		private var frictionMove:int;
		private var acceleration:int;
		
		public function MoveBox() {
			init();
			addListener();
		}
		
		public function init() {
			this.x = 243;
			this.y = 485;
			floorType = 0;
			force = 15;
			weight = 20;
			frictionMove = 3;
			frictionStatic = 10;
		}
		
		private function addListener():void {
			this.addEventListener(Event.ENTER_FRAME, movement);
		}
		
		private function movement(e:Event):void {
			if (moveAble)
			{
				this.x += acceleration;
				//trace("x:" + this.x + "y:" + this.y);
				if (this.x > 1300)
				{
					moveAble = false;
				}
			}
			else
			{
				
			}
		}
		
		public function weightUp():void {
			if( weight < maxWeight)
				weight += 5;
		}
		
		public function weightDown():void {
			if( weight > minWeight)
				weight -= 5;
		}
		
		public function getWeight():int {
			return weight;
		}
		
		public function setFloorType(type:int):void {
			floorType = type;
		}
		
		public function setAcceleration():void {
			if (force < frictionStatic)
			{
				acceleration = 0;
			}
			else {
				//acceleration = (force - frictionMove) / weight;
				acceleration = 3;
			}
		}
	}
	
}
