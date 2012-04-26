package objects
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Topic extends Sprite
	{
		public var qq:TextField = new TextField();
		private var formate:TextFormat = new TextFormat();
		public var ans1:AnsOption = new AnsOption();
		public var ans2:AnsOption = new AnsOption();
		public var ans3:AnsOption = new AnsOption();
		public var ans:String = new String();
		
		public function Topic()
		{
			super();
			init();
			this.ans1.addEventListener(MouseEvent.CLICK, checkAns, false, 0, true);
			this.ans2.addEventListener(MouseEvent.CLICK, checkAns, false, 0, true);
			this.ans3.addEventListener(MouseEvent.CLICK, checkAns, false, 0, true);
		}
		
		public function checkAns(e:MouseEvent):Boolean{
			if(e.target.text == ans)
			{
				trace("答對");
				return true;
			}
			else
			{
				trace("答錯");
				return false;
			}
		}
		
		public function init():void{
			formate.size = 27;
			formate.color = 0xffffff;
			formate.font = "微軟正黑體";
			formate.align = "left";
			
			this.qq.x = -300;
			this.qq.y = -25;
			this.qq.multiline = true;
			this.qq.wordWrap = true;
			this.qq.width = 800;
			//this.qq.text = "這是測試文字";
			this.qq.setTextFormat(formate);
			this.qq.selectable = false;
			this.addChild(qq);
			
			ans1.x = -300;
			ans1.y = 65;
			ans1.setText("ssssssssssss");
			this.addChild(ans1);
			
			ans2.x = 0;
			ans2.y = 65;
			ans2.setText("ssssssssssss");
			this.addChild(ans2);
			
			ans3.x = 300;
			ans3.y = 65;
			ans3.setText("ssssssssssss");
			this.addChild(ans3);
		}
		
		public function setTopicString(q:String = "s", a1:String = "s", a2:String = "s", a3:String = "s", a:String = "s"):void{
			this.qq.htmlText = q;
			this.qq.setTextFormat(formate);
			ans1.setText(a1);
			ans2.setText(a2);
			ans3.setText(a3);
			ans = a;
		}
		
	}
}