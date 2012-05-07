package objects {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Illustrate extends MovieClip {
		
		
		public function Illustrate() {
			this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler, false, 0, true);
		}
		
		public function  mouseUpHandler(e:MouseEvent) {
			this.parent.removeChild(this);
		}
	}
	
}
