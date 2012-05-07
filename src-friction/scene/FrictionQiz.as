package scene {
	
	import adobe.utils.CustomActions;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import objects.MyButton;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	import objects.AnsOption;
	import objects.FrictionQizAnimate1;
	import objects.Topic;
	import objects.frictionQizAnimate2;
	import objects.frictionQizAnimate3;
	import fl.motion.MotionEvent;

	
	public class FrictionQiz extends MovieClip {
		//public var topic:Topic = new Topic();
		public var topic:Topic;
		public var btn_pre:SimpleButton;
		public var btn_next:SimpleButton;
		public var btn_play:MyButton;
		public var mc1:FrictionQizAnimate1;
		public var mc2:frictionQizAnimate2;
		public var mc3:frictionQizAnimate3;
		
		private var snd:Sound = new Sound();
        private var channel:SoundChannel = new SoundChannel();
		
		//問答題內容設定
		private var xmlLoader:URLLoader;
		private var exams:XML = 
<exam>
	<topic>
		<question>Q.哪種方法不能減少摩擦力?</question>
		<option>增加接觸面積</option>
		<option>在桌子上抹油</option>
		<option>加輪子</option>
	</topic>
	<topic>
		<question>Q.一個箱子重100kgw放置於靜摩擦係數為0.3的桌面上，至少要用多少力(N)才能把蛋糕拖走？</question>
		<option>40</option>
		<option>20</option>
		<option>30</option>
	</topic>
	<topic>
		<question>Q.相同箱子，分別放在坡度不等的斜面上傾斜程度甲＜乙＜丙，坡面的介面、放置方式都一樣，三個物體移動的摩擦力誰最大？</question>
		<option>甲＞乙＞丙</option>
		<option>乙＞甲＞丙</option>
		<option>丙＞乙＞甲</option>
	</topic>
</exam>
	/*#################################*/	
		
		public function FrictionQiz() {
			//問題顯示
			this.setQuestion(0);
			
			/*音效設定
			 */
			this.snd.load(new URLRequest("back_sound.MP3"));
			this.addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removeFromeStageHandler);
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
		
		//音效設定
		public function addToStageHandler(e:Event):void {
			this.channel = this.snd.play(0, 100);
		}
		
		public function removeFromeStageHandler(e:Event):void {
			this.channel.stop();
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
	}
	
}
