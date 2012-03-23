package objects 
{
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author yatinglo
	 */
	public class ShowInfo extends TextField 
	{
		private var information:String;
		public function ShowInfo() 
		{
			
		}
		
		public function setInfo:String(force:Number,weight:Number,staticFriction:Number,maxFriction:Number,moveFriction:Number,acculation:Number) 
		{
			information =	"施力：" + force + "\n" +
							"重量：" + weight +"\n" +
							"靜摩擦力：" + staticFriction+"\n" +
							"最大靜摩擦力：" + maxFriction+"\n" +
							"動摩擦力：" + moveFriction+"\n" +
							"移動速度：" + acculation;
		}
		return this.information;
	}

}