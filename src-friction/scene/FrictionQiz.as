package scene {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import objects.AnsOption;

	
	public class FrictionQiz extends MovieClip {
		
		public var question:TextField;
		public var ans1:AnsOption;
		public var ans2:AnsOption;
		public var ans3:AnsOption;
		
		private var exams:XML;
		private var xmlLoader:URLLoader;
		
		public function FrictionQiz() {
			this.question.text = "hello";
			this.question.width  = 840;
			this.question.wordWrap = true;
			
			this.ans1.word.text = "1111111111";
		}
		
		public function LoadXml():void {
            xmlLoader = new URLLoader();
            xmlLoader.addEventListener(Event.COMPLETE, onXMLLoaded);
            xmlLoader.load(new URLRequest("xml/frictionQiz.xml"));
        }
		
        public function onXMLLoaded(e:Event):void {
            exams = new XML(e.target.data);
            trace(exams.topic[0].option[0]);
			trace(this.question.text);
        }
		
		public function setQuestion(num:int):void {
			this.question.text = exams.topic[num].question;
			/*
			this.ans1.word.text = exams.topic[num].option[0];
			this.ans2.word.text = exams.topic[num].option[1];
			this.ans3.word.text = exams.topic[num].option[2];
			*/
		}
	}
	
}
