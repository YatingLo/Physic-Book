package scene {
	
	import adobe.utils.CustomActions;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import objects.FrictionQizAnimate1;
	import objects.frictionQizAnimate2;
	import objects.frictionQizAnimate3;
	
	import objects.AnsOption;
	import objects.Topic;

	
	public class FrictionQiz extends MovieClip {
		//public var topic:Topic = new Topic();
		public var topic:Topic;
		public var btn_pre:SimpleButton;
		public var btn_next:SimpleButton;
		public var btn_play:SimpleButton;
		public var mc1:FrictionQizAnimate1;
		public var mc2:frictionQizAnimate2;
		public var mc3:frictionQizAnimate3;
		
		private var exams:XML;
		private var xmlLoader:URLLoader;
		
		public function FrictionQiz() {
			this.LoadXml();
			
			this.btn_next.addEventListener(MouseEvent.CLICK, goNext, false, 0, true);
			this.btn_pre.addEventListener(MouseEvent.CLICK, goPre, false, 0, true);
			this.btn_play.addEventListener(MouseEvent.CLICK, this.move, false, 0, true);
		}
		
		public function LoadXml():void {
            xmlLoader = new URLLoader();
            xmlLoader.addEventListener(Event.COMPLETE, onXMLLoaded);
            xmlLoader.load(new URLRequest("xml/frictionQiz.xml"));
        }
		
        public function onXMLLoaded(e:Event):void {
            exams = new XML(e.target.data);
            trace(exams.topic[0].option[0]);
			
			this.setQuestion(0);
			this.btn_pre.enabled = false;
			this.btn_pre.visible = false;
        }
		
		public function move(e:MouseEvent):void {
			switch (this.currentFrame) 
			{
				case 1:
					this.mc1.move(e);
				break;
				case 2:
					this.mc2.move(e);
				break;
				case 3:
					this.mc3.move(e);
				break;
				default:
			}
		}
		
		/*
		 * 問題亂數排列
		 */
		
		public function setQuestion(num:int):void {
			var r:int = Math.floor(Math.random()*3);
			
			this.topic.qq.text = exams.topic[num].question;
			this.topic.setTopicString(exams.topic[num].question
				,exams.topic[num].option[r % 3]
				,exams.topic[num].option[++r % 3]
				,exams.topic[num].option[++r % 3]
				,exams.topic[num].option[0]);
		}
		
		/*
		 * 問題切換按鍵
		 */
		
		public function goNext (e:MouseEvent):void{
			if(this.currentFrame < 3) {
				this.gotoAndStop(this.currentFrame + 1);
				this.setQuestion(this.currentFrame - 1);
				if(this.currentFrame == 2)
				{
					this.btn_pre.enabled = true;
					this.btn_pre.visible = true;
				}
				else if(this.currentFrame == 3)
				{
					this.btn_next.enabled = false;
					this.btn_next.visible = false;
				}
			}
		}
		
		public function goPre (e:MouseEvent):void{
			if(this.currentFrame > 1) {
				this.gotoAndStop(this.currentFrame - 1);
				this.setQuestion(this.currentFrame - 1);
				if(this.currentFrame == 2)
				{
					this.btn_next.enabled = true;
					this.btn_next.visible = true;
				}
				else if(this.currentFrame == 1)
				{
					this.btn_pre.enabled = false;
					this.btn_pre.visible = false;
				}
			}
		}
	}
	
}
