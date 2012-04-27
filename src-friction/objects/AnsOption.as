package objects {
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	
	public class AnsOption extends Sprite {
		
		//public var word:TextField = new TextField();
		public var word:TextField;
		
		private var formate:TextFormat = new TextFormat();
		private var hitCube:Sprite = new Sprite();
		private const textWidth = 180;
		
		public function AnsOption() {
			formate.size = 25;
			formate.color = 0xffffff;
			formate.font = "foo";
			formate.align = "left";
			
			this.word.selectable = false;
			this.word.width = textWidth;
			this.word.embedFonts = true;
			//word.setTextFormat(formate);
			//this.addChild(word);
			
			this.hitCube.graphics.beginFill(0xccff00);
			this.hitCube.graphics.drawRect(0, 0, textWidth+10, 50);
			this.hitCube.mouseEnabled = false;
			
			this.addChild(hitCube);
			this.hitCube.visible = false;
			this.hitArea = this.hitCube;
			
		}
		
		public function setText(s:String):void{
			this.word.text = s;
		}
	}
	
}
