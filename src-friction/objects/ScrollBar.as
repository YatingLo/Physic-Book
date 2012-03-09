package objects
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	public class ScrollBar extends MovieClip
	{
		private var drag_area:Rectangle;
		private var scroll_area_point:Point = new Point( -141.5, -18.5);
		private var scroller_point:Point = new Point( -134, -16);
		private var scroller_long:Number;
		private var max_num:Number = 0.5; //num*100
		private var force_num:int;
		
		public var scroller:MovieClip;
		public var scroll_area:MovieClip;
		public var forceNum:TextField;
		
		public function ScrollBar()
		{
			super();
			scroller_long = scroll_area.width - scroller.width - 14;
			drag_area = new Rectangle(scroller_point.x, scroller_point.y, scroller_long, 0); 
			scroller.addEventListener(MouseEvent.MOUSE_DOWN, scroller_drag);
			scroller.addEventListener(MouseEvent.MOUSE_UP, scroller_drop);
			scroller.addEventListener(MouseEvent.MOUSE_MOVE, on_scroll);

			this.setForceNum();
			
		}
		
		function scroller_drag( me:MouseEvent ):void
		{
			me.target.startDrag(false, drag_area);
			stage.addEventListener(MouseEvent.MOUSE_UP, up);
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
		/*
		public function Enable():void
		{
			this.enabled = true;
			this.visible = true;
		}
		
		public function Disable():void
		{
			this.enabled = false;
			this.visible = false;
		}
		*/
		public function setForceNum():void {
			force_num = (scroller.x-scroller_point.x)/scroller_long/0.01*max_num;
			this.forceNum.text = force_num.toString() + "kg";
		}
		
		public function getForceNum():int {
			//trace(forceNum.text.toString());
			return new Number(force_num.toString());
		}
	}
}