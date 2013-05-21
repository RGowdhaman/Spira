package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import screens.InGame;
	import screens.game.Compositing;
	import screens.test.CreateSpi;
	import screens.test.Spectrum;
	import screens.test.lights;
	import screens.test.testScreen;
	
	import starling.core.Starling;
	import starling.display.Shape;
	
	[SWF(frameRate="60", width="2048", height="1536", backgroundColor="0xEEEEEE")]
	public class Spira extends Sprite
	{
		
		private var myStarling:Starling;
		
		public function Spira()
		{
			//var spectre:Spectrum = new Spectrum();
			//addChild(spectre);
			
			
			
			
			trace('Spira loaded');
			// Screen dimension (screen device)
			var screenWidth:int = stage.fullScreenWidth;
			var screenHeight:int = stage.fullScreenHeight;
			
			
			
			trace('stage.fullScreenWidth: ',screenWidth, 'stage.fullScreenHeight: ', screenHeight);
			var viewPort:Rectangle = new Rectangle(0,0,screenWidth, screenHeight);
			
			
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;
			Starling.multitouchEnabled = true;
		
			
			
			myStarling = new Starling(screens.test.lights, stage, viewPort);
			
			// default screen size (mac debug)
			myStarling.stage.stageWidth  = 1024;
			myStarling.stage.stageHeight = 768;
			
			trace('starling.stage.stageWidth: ', myStarling.stage.stageWidth,'starling.stage.stageHeight: ', myStarling.stage.stageHeight);
			
			// REMOVE ERROR CHECKING FOR PERFOMANCE
			myStarling.enableErrorChecking = true;
			myStarling.simulateMultitouch = true;
			myStarling.antiAliasing = 1;
			myStarling.showStats = true;
			myStarling.start();
		}
	}
}