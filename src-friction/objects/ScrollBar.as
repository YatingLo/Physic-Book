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
		
		public var scroller:MovieClip;
		public var scroll_area:MovieClip;
		public var forceNum:TextField;
		
		public function ScrollBar()
		{
			super();
			
			drag_area = new Rectangle(scroller_point.x, scroller_point.y, scroll_area.width - scroller.width - 14, 0); 
			scroller.addEventListener(MouseEvent.MOUSE_DOWN, scroller_drag);
			scroller.addEventListener(MouseEvent.MOUSE_UP, scroller_drop);
			//this.addEventListener(Event.ENTER_FRAME, on_scroll);
			
		}
		
		function scroller_drag( me:MouseEvent ):void
		{
			me.target.startDrag(false, drag_area);
			stage.addEventListener(MouseEvent.MOUSE_UP, up);
		}
		
		function scroller_drop( me:MouseEvent ):void
		{
			me.target.stopDrag();
			stage.removeEventListener(MouseEvent.MOUSE_UP, up);
		}
		
		function up( me:MouseEvent ):void
		{
			scroller.stopDrag();
		}
		
		function on_scroll( e:Event ):void
		{
			
		}
		
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
		
		public function setForceNum(num:int):void {
			this.forceNum.text = num.toString() + "kg";
		}
	}
}