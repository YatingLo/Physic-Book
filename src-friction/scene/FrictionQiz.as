package scene {
	
	import adobe.utils.CustomActions;
	
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

	
	public class FrictionQiz extends MovieClip {
		//public var topic:Topic = new Topic();
		public var topic:Topic;
		public var btn_pre:SimpleButton;
		public var btn_next:SimpleButton;
		public var btn_play:SimpleButton;
		public var mc1:FrictionQizAnimate1;
		public var mc2:frictionQizAnimate2;
		public var mc3:frictionQizAnimate3;
		
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
			//this.LoadXml();
			this.setQuestion(0);
			this.btn_pre.enabled = false;
			this.btn_pre.visible = false;
			//觸碰
			//this.btn_next.addEventListener(TouchEvent.TOUCH_END, goNext, false, 0, true);
			//this.btn_pre.addEventListener(TouchEvent.TOUCH_END, goPre, false, 0, true);
			//this.btn_play.addEventListener(TouchEvent.TOUCH_END, this.move, false, 0, true);
			//滑鼠
			this.btn_next.addEventListener(MouseEvent.MOUSE_UP, goNext, false, 0, true);
			this.btn_pre.addEventListener(MouseEvent.MOUSE_UP, goPre, false, 0, true);
			this.btn_play.addEventListener(MouseEvent.MOUSE_UP, this.move, false, 0, true);
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
		
		public function goNext (e:Event):void{
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
		
		public function goPre (e:Event):void{
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
