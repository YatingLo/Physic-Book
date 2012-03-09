// Copyright w w w . f l a s h m o . c o m
// Developed by Min Thu

var sd:Number;
var sr:Number;
var cd:Number;
var cr:Number;
var new_y:Number;
var drag_area:Rectangle;

var flashmo_content:MovieClip;
var flashmo_content_area:MovieClip;
var scrolling_speed:Number; // 0.00 to 1.00

function scrolling( ct:String, ct_area:String, speed:Number ):void
{
	scrolling_speed = speed;
	if( scrolling_speed < 0 || scrolling_speed > 1 ) scrolling_speed = 0.50;
	
	flashmo_content = parent[ct];
	flashmo_content_area = parent[ct_area];
	
	flashmo_content.mask = flashmo_content_area;
	flashmo_content.x = flashmo_content_area.x;
	flashmo_content.y = flashmo_content_area.y;
	
	flashmo_scroller.x = flashmo_scrollable_area.x;
	flashmo_scroller.y = flashmo_scrollable_area.y;
	
	sr = flashmo_content_area.height / flashmo_content.height;
	flashmo_scroller.height = flashmo_scrollable_area.height * sr;
	
	sd = flashmo_scrollable_area.height - flashmo_scroller.height;
	cd = flashmo_content.height - flashmo_content_area.height;
	cr = cd / sd * 1.01;
	
	drag_area = new Rectangle(0, 0, 0, flashmo_scrollable_area.height - flashmo_scroller.height);
	
	//內容不多不顯示拉霸
	if ( flashmo_content.height <= flashmo_content_area.height )
	{
		flashmo_scroller.visible = flashmo_scrollable_area.visible = false;
	}
	
	flashmo_scroller.addEventListener( MouseEvent.MOUSE_DOWN, scroller_drag );
	flashmo_scroller.addEventListener( MouseEvent.MOUSE_UP, scroller_drop );
	this.addEventListener( Event.ENTER_FRAME, on_scroll );
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
	flashmo_scroller.stopDrag();
}
function on_scroll( e:Event ):void
{
	new_y = flashmo_content_area.y + flashmo_scrollable_area.y * cr - flashmo_scroller.y  * cr;
	flashmo_content.y += ( new_y - flashmo_content.y ) * scrolling_speed;
}// ActionScript file