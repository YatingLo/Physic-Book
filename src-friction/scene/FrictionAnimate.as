package scene {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import objects.Floor;
	import objects.MoveBox;
	import objects.MyButton;
	import objects.media.BackSound;
	
	public class FrictionAnimate extends MovieClip {
		
		public var floor:Floor;
		public var iron_btn:SimpleButton;
		public var wood_btn:SimpleButton;
		public var sand_btn:SimpleButton;
		public var weightup_btn:SimpleButton;
		public var weightdown_btn:SimpleButton;
		public var play_btn:MyButton;
		public var weightnum:TextField;
		public var dataShow:TextField;
		private var formate:TextFormat = new TextFormat();
		public var box:MoveBox;
		
		private var snd:BackSound = new BackSound();
        private var channel:SoundChannel = new SoundChannel();
		
		public function FrictionAnimate() {
			this.setWeightNum(box.getWeight);
			Object(this).play_btn.addEventListener(MouseEvent.MOUSE_UP, playHandle);
			this.box.addEventListener(Event.ENTER_FRAME, animateHandle);
			Object(this).iron_btn.addEventListener(MouseEvent.MOUSE_UP, ironfloor);
			Object(this).sand_btn.addEventListener(MouseEvent.MOUSE_UP, sandfloor);
			Object(this).wood_btn.addEventListener(MouseEvent.MOUSE_UP, woodfloor);
			Object(this).weightup_btn.addEventListener(MouseEvent.MOUSE_UP, weightup);
			Object(this).weightdown_btn.addEventListener(MouseEvent.MOUSE_UP, weightdown);
			
			
			
			/*音效設定
			 */
			//this.snd.load(new URLRequest("back_sound.MP3"));
			this.addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removeFromeStageHandler);
			
			/*
			 * 字型設定
			*/
			this.weightnum.embedFonts = true;
			this.dataShow.embedFonts = true;
		}
		
		public function weightdown(e:Event):void {
				box.weightDown();
				this.setWeightNum(box.getWeight);
		}
		
		public function weightup(e:Event):void {
				box.weightUp();
				this.setWeightNum(box.getWeight);
		}
		
		public function woodfloor(e:Event):void {
				Object(this).floor.gotoAndStop(2);
				Object(this).box.setFloorType(2);
		}
		
		public function sandfloor(e:Event):void {
				Object(this).floor.gotoAndStop(3);
				Object(this).box.setFloorType(3);
		}
		
		public function ironfloor(e:Event):void {
				Object(this).floor.gotoAndStop(1);
				this.box.setFloorType(1);
		}
		public function animateHandle(e:Event):void{
		if(box.moveAble == true)
		{
					box.movement();
					//文字顯示
					this.dataShow.text = this.setInfo(box.getForce, box.getWeight, box.getFrictionMax, box.getFrictionMove, box.getAcceleration);
					//this.dataShow.setTextFormat(formate);
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
		
		public function playHandle(e:Event):void {
			trace(this.play_btn.currentFrameLabel);
			switch (play_btn.currentFrameLabel) 
			{
				//trace(""+this.play_btn.currentFrameLabel);
				case "play":
					play_btn.ShiningDisabled();
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
			return new String("施力：" + this.trans(force, 0) + " N\n" +
							"重量：" + this.trans(weight, 0) +" kgw\n" +
							"最大靜摩擦力：" + this.trans(maxFriction, 2)+" N\n" +
							"動摩擦力：" + this.trans(moveFriction, 2)+" N\n" +
							"移動加速度：" + this.trans(acculation, 2)+" m/s2");
		}

		public function btnEndabled(obj:SimpleButton, b:Boolean){
			obj.enabled = b;
			obj.mouseEnabled = b;
		}
		
		public function setWeightNum(weight:Number):void {
			Object(this).weightnum.text = weight.toString() + " kgw";
		}
		
		public function addToStageHandler(e:Event):void {
			this.channel = this.snd.play(0, 100);
		}
		
		public function removeFromeStageHandler(e:Event):void {
			this.channel.stop();
		}
		
		public function trans(num, precision = 0, splitCharacter = null)
		{
		  if ((precision=Math.abs(precision)) == 0)
		  {
			return Math.round(num);
		  }
		  if (splitCharacter == null)
		  {
			splitCharacter = ".";
		  }
		  return Math.floor(num) + splitCharacter + Math.floor(num * Math.pow(10, precision)).toString().substr(-precision);
		  trace("number show:" + Math.abs(num * Math.pow(10, precision)));
		}
	}
	
}
