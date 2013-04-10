package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	import starling.core.Starling;
	
	[SWF(frameRate="60", width="1024", height="768", backgroundColor="0xEEEEEE")]
	public class Spira extends Sprite
	{
		
		private var myStarling:Starling;
		
		public function Spira()
		{
			trace('Spira loaded');
			

			var screenWidth:int = stage.fullScreenWidth;
			var screenHeight:int = stage.fullScreenHeight;
			var viewPort:Rectangle = new Rectangle(0,0,screenWidth, screenHeight);
			var stageScale:int = screenWidth/1024;
			
			
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;
			Starling.multitouchEnabled = true;
			
			myStarling = new Starling(Game, stage, viewPort);
			
			myStarling.stage.stageWidth = 1024*stageScale;
			myStarling.stage.stageHeight = 768*stageScale;
			
			
			myStarling.simulateMultitouch = true;
			myStarling.antiAliasing = 1;
			myStarling.showStats = true;
			myStarling.start();
			trace(screenWidth/viewPort.width);
			trace(screenWidth, viewPort.width);
			trace(myStarling.contentScaleFactor);
		}
	}
}