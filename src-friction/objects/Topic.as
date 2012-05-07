package objects
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Topic extends Sprite
	{
		public var qq:TextField;
		public var ans1:AnsOption;
		public var ans2:AnsOption;
		public var ans3:AnsOption;
		public var ans:String = new String();
		public var request:Request = new Request();
		
		public function Topic()
		{
			super();
			init();
			
			this.ans1.addEventListener(MouseEvent.CLICK, checkAns, false, 0, true);
			this.ans2.addEventListener(MouseEvent.CLICK, checkAns, false, 0, true);
			this.ans3.addEventListener(MouseEvent.CLICK, checkAns, false, 0, true);
		}
		
		public function checkAns(e:MouseEvent):Boolean{
			/*
			 * 字串處理後再檢查答案
			 */
			var a:String = e.target.text;
			if(a.slice(3, a.length) == ans)
			{
				trace("答對");
				if (!this.request.isAdded)
				{
					this.addChild(request);
					this.request.gotoAndStop(1);
				}
				return true;
			}
			else
			{
				trace("答錯");
				if (!this.request.isAdded)
				{
					this.addChild(request);
					this.request.gotoAndStop(2);
				}
				return false;
			}
		}
		
		public function init():void{

			this.qq.multiline = true;
			this.qq.wordWrap = true;
			this.qq.embedFonts = true;
			this.qq.width = 800;
			
			this.qq.selectable = false;
		}
		
		public function setTopicString(q:String = "s", a1:String = "s", a2:String = "s", a3:String = "s", a:String = "s"):void{
			this.qq.htmlText = q;
			
			ans1.setText("1. "+a1);
			ans2.setText("2. "+a2);
			ans3.setText("3. "+a3);
			ans = a;
		}
		
	}
}