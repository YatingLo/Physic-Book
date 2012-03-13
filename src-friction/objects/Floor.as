package  objects{
	
	import flash.display.MovieClip;
	
	
	public class Floor extends MovieClip {
		public static const IRONMOVE:Number = 0.18;
		public static const IRONSTATIC:Number = 0.2;
		public static const WOODMOVE:Number = 0.2;
		public static const WOODSTATIC:Number = 0.4;
		public static const SANDMOVE:Number = 0.4;
		public static const SANDSTATIC:Number = 0.45;
		/*
			http://www.cnctechnet.com/post/1627.html
			摩擦係數大全
			http://www.supercivilcd.com/FRICTION.htm
			摩擦係數表
			材質	靜		動
			鐵		0.2		0.18
			木		0.4-0.6	0.2-0.5
			沙		0.45	0.4
		*/
		public function Floor() {
			super();
		}
		
		public function goto() {
			gotoAndStop(2);
		}
	}
	
}
