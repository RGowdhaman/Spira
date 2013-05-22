package
{
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import com.mikesoylu.fortia.fAssetManager;
	
	import events.NavigationEvent;
	
	import flash.utils.setTimeout;
	
	import spira.assets.SpiraAssets;
	import spira.models.NavOptions;
	import spira.screens.Intro;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		
		private var screen:Sprite;
		
		private var background:Image;
		
		public function Game()
		{
			super();
			
			fAssetManager.addManager("game");
			fAssetManager.addManager("loader");
			
			// enqueue the static contents of the Asset class and give it a name
			fAssetManager.enqueue("game", spira.assets.SpiraAssets);
			
			fAssetManager.enqueue("loader", spira.assets.IntroAssets);
			
			// start loading the assets
			fAssetManager.loadQueues(initialize);
			
			addEventListener('navigate', changeScene);
			//startup();
			//this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage );	
		}
		
		private function initialize():void
		{
			background = new Image(fAssetManager.getTexture("background"));
			background.alpha = 0;
			addChild(background);
			TweenMax.to(background, 0.4,{alpha:1, onComplete:startup});
			
		}
		private function changeScene(e:Event):void
		{
			setScene(NavOptions(e.data) );
		}		
		
		private function startup():void
		{
			trace('start up');
			setScene( new NavOptions('intro') );
		}
		
		private function setScene(options:NavOptions):void
		{
			if( screen ){
				removeChild(screen);
				screen = null;
			}
	
			switch(options.screenId)
			{
				case 'intro': screen = new Intro(); break;
				/*case 'game':  screen = new Game(); break;
				case 'end':  screen = new End(options.data); break;*/
			}
			if(screen) addChild(screen);
		}
	}
}