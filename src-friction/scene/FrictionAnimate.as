﻿package scene {
	
	import flash.display.MovieClip;
	import objects.Floor;
	import objects.MoveBox;
	import flash.text.TextField;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	
	public class FrictionAnimate extends MovieClip {
		
		public var floor:Floor;
		public var iron_btn:SimpleButton;
		public var wood_btn:SimpleButton;
		public var sand_btn:SimpleButton;
		public var weightup_btn:SimpleButton;
		public var weightdown_btn:SimpleButton;
		public var weightnum:TextField;
		public var play_btn:MovieClip;
		public var dataShow:TextField;
		public var box:MoveBox;
		
		public function FrictionAnimate() {
			this.setWeightNum(box.getWeight);

			Object(this).play_btn.addEventListener(MouseEvent.CLICK, playHandle);
			this.box.addEventListener(Event.ENTER_FRAME, animateHandle);
			Object(this).iron_btn.addEventListener(MouseEvent.CLICK, ironfloor);
			Object(this).sand_btn.addEventListener(MouseEvent.CLICK, sandfloor);
			Object(this).wood_btn.addEventListener(MouseEvent.CLICK, woodfloor);
			Object(this).weightup_btn.addEventListener(MouseEvent.CLICK, weightup);
			Object(this).weightdown_btn.addEventListener(MouseEvent.CLICK, weightdown);
			
		}
		
		public function weightdown(e:MouseEvent):void {
				box.weightDown();
				this.setWeightNum(box.getWeight);
		}
		
		public function weightup(e:MouseEvent):void {
				box.weightUp();
				this.setWeightNum(box.getWeight);
		}
		
		public function woodfloor(e:MouseEvent):void {
				Object(this).floor.gotoAndStop(2);
				Object(this).box.setFloorType(2);
		}
		
		public function sandfloor(e:MouseEvent):void {
				Object(this).floor.gotoAndStop(3);
				Object(this).box.setFloorType(3);
		}
		
		public function ironfloor(e:MouseEvent):void {
				Object(this).floor.gotoAndStop(1);
				this.box.setFloorType(1);
		}
				public function animateHandle(e:Event):void{
				if(box.moveAble == true)
				{
					box.movement();
					//文字顯示
					this.dataShow.text = this.setInfo(box.getForce, box.getWeight, box.getFrictionMax, box.getFrictionMove, box.getAcceleration);
					this.btnEndabled(this.weightdown_btn, false);
					this.btnEndabled(this.weightup_btn, false);
					this.btnEndabled(this.iron_btn, false);
					this.btnEndabled(this.wood_btn, false);
					this.btnEndabled(this.sand_btn, false);
				}
				else if (box.moveAble == false)
				{
					this.btnEndabled(this.weightdown_btn, true);
					this.btnEndabled(this.weightup_btn, true);
					this.btnEndabled(this.iron_btn, true);
					this.btnEndabled(this.wood_btn, true);
					this.btnEndabled(this.sand_btn, true);
				}
				if (box.outStage == true && box.moveAble == false)
				{
					this.play_btn.gotoAndStop("return");
					box.outStage = false;
				}
			}
		
		public function playHandle(e:MouseEvent):void {
			trace(this.play_btn.currentFrameLabel);
			switch (play_btn.currentFrameLabel) 
			{
				//trace(""+this.play_btn.currentFrameLabel);
				case "play":
					play_btn.gotoAndStop("pause");
					box.moveEnabled();
				break;
				case "pause":
					play_btn.gotoAndStop("play");
					box.moveDisabled();
					Object(this).weightup_btn.enabled = true;
					Object(this).weightdown_btn.enabled = true;
				break;
				case "return":
					box.stateReset();
					play_btn.gotoAndStop("play");
				break;
				default:
				break;
			}
		}
		
		public function setInfo(force:Number,weight:Number,maxFriction:Number,moveFriction:Number,acculation:Number):String 
		{
			return new String("施力：" + force + "\n" +
							"重量：" + weight +"\n" +
							"最大靜摩擦力：" + maxFriction+"\n" +
							"動摩擦力：" + moveFriction+"\n" +
							"移動加速度：" + acculation);
		}

		public function btnEndabled(obj:SimpleButton, b:Boolean){
			obj.enabled = b;
			obj.mouseEnabled = b;
		}
		
		public function setWeightNum(weight:Number):void {
				Object(this).weightnum.text = weight.toString() + "kg";
		}
	}
	
}
