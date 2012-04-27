﻿package objects {
	
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
		//private var floorType:int;
		
		private var boxX:Number = 0;
		private var boxY:Number = 0;
		
		private var weight:Number;
		public function get getWeight():Number { return weight; };
		private var maxWeight:Number = 50;
		private var minWeight:Number = 5;
		private var force:Number;
		public function get getForce():Number { return force; };
		private var frictionStatic:Number;
		public function get getFrictionMax():Number { return frictionStatic; };
		private var frictionMove:Number;
		public function get getFrictionMove():Number { return frictionMove; };
		private var frictionStaticTrue:int = 0;
		public function get getFriction():Number { return frictionStaticTrue; };
		private var acceleration:Number;
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
			force = 0;
			weight = 25;
			//紀錄原始位置
			this.addEventListener(Event.ADDED_TO_STAGE, addStageHandler, false, 0, true);
			
			//設定計算動靜摩擦力
			this.setFrictionValue(Floor.IRONMOVE, Floor.IRONSTATIC);
			
			formate.size = 27;
			formate.color = 0x000000;
			formate.font = "foo";
			formate.align = "left";
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
			trace("disable move");
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
			trace("set force"+ frictionMove +" static:"+ frictionStatic);
		}
		
		public function setFrictionValue(m:Number, s:Number):void {
			frictionValueMove = m;
			frictionValueStatic = s;
			trace("set force value"+ m+ s);
			trace("set force value"+ frictionValueMove+frictionValueStatic);
		}
		
		public function setAcceleration():void {
			if (force < frictionStatic)
			{
				if (speed <= 0)
				{
					this.frictionStatic = force;
					acceleration = 0;
				}
				else if (speed > 0)
				{
					acceleration = (force - frictionMove) / weight;
				}
			}
			else {
				this.frictionStaticTrue = this.frictionMove;
				acceleration = (force - frictionMove) / weight;
			}
		}
		
		function addStageHandler(e:Event):void {	
			this.boxX = x;
			this.boxY = y;
			this.removeEventListener(Event.ADDED_TO_STAGE, addStageHandler);
		}
	}
	
}
