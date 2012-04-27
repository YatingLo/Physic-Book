package objects
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.AntiAliasType;
	
	public class ScrollBar extends MovieClip
	{
		private var drag_area:Rectangle;
		//private var scroll_area_point:Point = new Point( -141.5, -18.5);
		//private var scroller_point:Point = new Point( -134, -16);
		private var scroll_area_point:Point;
		private var scroller_point:Point;
		private var scroller_long:Number;
		private var max_num:Number = 0.5; //num*100
		private var force_num:int;
		private var formate:TextFormat = new TextFormat();
		
		public var scroller:MovieClip = new MovieClip;
		public var scroll_area:MovieClip;
		public var forceNum:TextField;
		//public var forceNum:TextField = new TextField;
		
		public function ScrollBar()
		{
			super();
			/*
			trace("scroller location: x=" + this.scroller.x + " y=" + this.scroller.y);
			trace("scroller_area location: x="+this.scroll_area.x+" y="+this.scroll_area.y);
			*設定移動珠的位置
			*/
			scroller.s = scroll_area.x + 5;
			scroller.y = scroll_area.y - 0.8;
			scroller_point = new Point(scroll_area.x + 7.5,scroll_area.y + 2);
			scroller_long = scroll_area.width - scroller.width - 14;
			drag_area = new Rectangle(scroller_point.x, scroller_point.y + 2, scroller_long, 0);
			
			scroller.addEventListener(MouseEvent.MOUSE_DOWN, scroller_drag);
			scroller.addEventListener(MouseEvent.MOUSE_UP, scroller_drop);
			scroller.addEventListener(MouseEvent.MOUSE_MOVE, on_scroll);
			/*
			 * 字型設定
			 */
			//[Embed(systemFont = "微軟正黑體", fontName = "ChineseFont", mimeType = "application/x-font", embedAsCFF = "false", unicodeRange = "U+0030-U+0039,U+002E")];
			formate.size = 30;
			formate.color = 0x000000;
			formate.font = "ChineseFont";
			formate.align = "center";
			
			this.forceNum.embedFonts = true;
			/*
			 * 數字顯示的位置
			 
			this.forceNum.width = 64;
			this.forceNum.height = 44;
			this.forceNum.x = 29.95;
			this.forceNum.y = -101.9;
			this.forceNum.text = "ww";
			this.forceNum.embedFonts = true;
			this.forceNum.setTextFormat(this.formate);
			this.addChild(this.forceNum);
			this.setForceNum();
			*/
		}
		
		function scroller_drag( me:MouseEvent ):void
		{
			me.target.startDrag(false, drag_area);
			stage.addEventListener(MouseEvent.MOUSE_UP, up);
			
			this.setForceNum();
		}
		
		function scroller_drop( me:MouseEvent ):void
		{
			//trace("drop");
			me.target.stopDrag();
			stage.removeEventListener(MouseEvent.MOUSE_UP, up);
		}
		
		function up( me:MouseEvent ):void
		{
			//trace("up");
			scroller.stopDrag();
		}
		
		function on_scroll( e:Event ):void
		{
			//trace("scroll");
			this.setForceNum();
		}

		public function setForceNum():void {
			force_num = (scroller.x-scroller_point.x)/scroller_long/0.01*max_num;
			this.forceNum.text = force_num.toString() + "kg";
			//this.forceNum.setTextFormat(formate);
		}
		
		public function getForceNum():int {
			//trace(forceNum.text.toString());
			return new Number(force_num.toString());
		}
	}
}