package scene {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	import objects.AnsOption;
	import objects.Topic;

	
	public class FrictionQiz extends MovieClip {
		public var topic:Topic = new Topic();
		public var btn_pre:SimpleButton;
		public var btn_next:SimpleButton;
		
		private var exams:XML;
		private var xmlLoader:URLLoader;
		
		public function FrictionQiz() {
			//this.addChild(topic);
			this.LoadXml();
			
			this.btn_next.addEventListener(MouseEvent.CLICK, goNext, false, 0, true);
			this.btn_pre.addEventListener(MouseEvent.CLICK, goPre, false, 0, true);
		}
		
		public function LoadXml():void {
            xmlLoader = new URLLoader();
            xmlLoader.addEventListener(Event.COMPLETE, onXMLLoaded);
            xmlLoader.load(new URLRequest("xml/frictionQiz.xml"));
        }
		
        public function onXMLLoaded(e:Event):void {
            exams = new XML(e.target.data);
            trace(exams.topic[0].option[0]);
			
			this.topic.x = -99.95;
			this.topic.y = 261.9;
			
			this.setQuestion(0);
			this.btn_pre.enabled = false;
			this.btn_pre.visible = false;
        }
		
		public function setQuestion(num:int):void {
			var r:int = Math.floor(Math.random()*3);
			
			this.topic.qq.text = exams.topic[num].question;
			this.topic.setTopicString(exams.topic[num].question
				,exams.topic[num].option[r % 3]
				,exams.topic[num].option[++r % 3]
				,exams.topic[num].option[++r % 3]
				,exams.topic[num].option[0]);
			this.addChild(topic);
		}
		
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
