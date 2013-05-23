package
{
	import com.greensock.TweenMax;
	import com.mikesoylu.fortia.fAssetManager;
	
	import flash.display.Sprite;
	import flash.utils.setTimeout;
	
	import spira.assets.Intro.Background;
	import spira.events.NavigationEvent;
	import spira.events.TransitionManager;
	import spira.events.TransitionManagerEvent;
	import spira.models.NavOptions;
	import spira.screens.Composer;
	import spira.screens.Intro;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		
		private var screen:Sprite;
		private var background:Image;
		
		private var gameManager:fAssetManager;
		private var splashLogo:Image;
		
		public function Game()
		{
			super();
			startup();
		}
		
		private function startup():void
		{
			
			// GLOBAL BACKGROUND
			
			gameManager = new fAssetManager();
			gameManager.enqueue(Background);
			gameManager.loadQueue(startScene);
			
		}
		
		private function startScene():void
		{
			background = new Image(gameManager.getTexture("background"));
			addChild(background);
			background.alpha = 1;
			
			splashLogo = new Image(gameManager.getTexture("splashLogo"));
			addChild(splashLogo);
			splashLogo.pivotX = splashLogo.width/2;
			splashLogo.pivotY = splashLogo.height/2;
			splashLogo.x = 1024/2;
			splashLogo.y = 768/2;
			
			splashLogo.alpha = 1;
			setTimeout(function():void{
				TweenMax.to(splashLogo,1,{alpha:0, onComplete:function():void{
					setScene( new NavOptions('intro') );
				}});
			},500);
		}
		
		private function setScene(options:NavOptions):void
		{
			if( screen ){
				trace('DISPATCH:: TRANSITION OUT');
				TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.TRANSITION_OUT));
				trace('ADD:: TRANSITION OUT COMPLETE');
				TransitionManager.addEventListener(TransitionManagerEvent.TRANSITION_OUT_COMPLETE, onDeleteScreen);
		
				function onDeleteScreen():void{
					trace('REMOVE:: TRANSITION OUT COMPLETE');
					TransitionManager.removeEventListener(TransitionManagerEvent.TRANSITION_OUT_COMPLETE, onDeleteScreen);
				
					removeChild(screen);
					removeEventsListener();
					screen = null;
					changeScene(options.screenId);
				}
			} else{
				changeScene(options.screenId);
			}
		}
		
		private function changeScene(scene:String):void
		{
			// NEW SCENE
			switch(scene)
			{
				case 'intro': screen = new Intro(); break;
				case 'composer': screen = new Composer(); break;
			}
			
			if(screen){
				addChild(screen);
			
				// on attend que les assets soit chargés
				trace('ADD:: ASSET LOADED');
				TransitionManager.addEventListener(TransitionManagerEvent.ASSET_LOADED, onAssetLoaded);
				
				function onAssetLoaded():void
				{
					// On remove le listener ASSET LOADED
					trace('REMOVE:: ASSET_LOADED');
					TransitionManager.removeEventListener(TransitionManagerEvent.ASSET_LOADED, onAssetLoaded);
					
					// On dispatch TRANSITION IN a la vue actuelle
					trace('DISPATCH:: TRANSITION IN'); 
					TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.TRANSITION_IN));
				}
				
				// On attend que la transition IN soit finit
				trace('ADD:: TRANSITION IN COMPLETE');
				TransitionManager.addEventListener(TransitionManagerEvent.TRANSITION_IN_COMPLETE, onAddedScreen);
			
				function onAddedScreen():void{
					// on enlve le listener sur TRANSITION IN COMPLETE
					trace('REMOVE:: TRANSITION IN COMPLETE');
					TransitionManager.removeEventListener(TransitionManagerEvent.TRANSITION_IN_COMPLETE, onAddedScreen);
					addEventsListener();
				}
				
			}
		}
		
		private function removeEventsListener():void
		{
			
			trace('REMOVE:: CHANGE SCREEN');
			screen.removeEventListener(NavigationEvent.CHANGE_SCREEN, handleChangeScreen);
			
		}
		
		private function addEventsListener():void
		{
			trace('ADD:: CHANGE_SCREEN');
			screen.addEventListener(NavigationEvent.CHANGE_SCREEN, handleChangeScreen);
			
		}
		
		private function handleChangeScreen(evt:NavigationEvent):void
		{
			trace('in handleChange: ', evt.data.view);
			if( evt.data.view ){
				setScene(new NavOptions(evt.data.view));
			}
			
		}
	}
}