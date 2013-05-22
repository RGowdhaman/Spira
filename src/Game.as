package
{
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
		private var oldScreen:Sprite;
		
		
		public function Game()
		{
			super();
			startup();
		}
		
		private function startup():void
		{
			
			// GLOBAL BACKGROUND
			fAssetManager.enqueue(Background);
			fAssetManager.loadQueue(startScene);
			
		}
		
		private function startScene():void
		{
			background = new Image(fAssetManager.getTexture("background"));
			addChild(background);
			
			trace('start scene');
			
			setScene( new NavOptions('intro') );
		}
		
		private function setScene(options:NavOptions):void
		{
			if( screen ){
				trace('CHANGE SCRREN');
				TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.TRANSITION_OUT));
				TransitionManager.addEventListener(TransitionManagerEvent.TRANSITION_OUT_COMPLETE, onDeleteScreen);
		
				function onDeleteScreen():void{
					TransitionManager.removeEventListener(TransitionManagerEvent.TRANSITION_OUT_COMPLETE, onDeleteScreen);
					trace('DELETE SCREEN');
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
			trace('::: new scene');
			// NEW SCENE
			switch(scene)
			{
				case 'intro': 
					screen = new Intro(); 
					break;
				case 'composer':
					screen = new Composer();
					break;
				/*case 'game':  screen = new Game(); break;
				case 'end':  screen = new End(options.data); break;*/
			}
			if(screen){
				addChild(screen);
				trace('ADD LISTENER: ASSET_LOADED');
				
				// on attend que les assets soit chargés
				TransitionManager.addEventListener(TransitionManagerEvent.ASSET_LOADED, onAssetLoaded);
				
				function onAssetLoaded():void
				{
					trace('ASSET LOADED');
					TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.TRANSITION_IN));
				}
				
				trace('ADD LISTENER: TRANSITION IN COMPLETE');
				TransitionManager.addEventListener(TransitionManagerEvent.TRANSITION_IN_COMPLETE, onAddedScreen);
			
				function onAddedScreen():void{
					TransitionManager.removeEventListener(TransitionManagerEvent.TRANSITION_IN_COMPLETE, onAddedScreen);
					trace('TRANSITION IN COMPLETE');
					addEventsListener();
				}
				
			}
		}
		
		
		
		private function removeEventsListener():void
		{
			screen.removeEventListener(NavigationEvent.CHANGE_SCREEN, handleChangeScreen);
			
		}
		
		private function addEventsListener():void
		{
			screen.addEventListener(NavigationEvent.CHANGE_SCREEN, handleChangeScreen);
			
		}
		
		private function handleChangeScreen(evt:NavigationEvent):void
		{
			if( evt.data.view ){
				setScene(new NavOptions(evt.data.view));
			}
			
		}
	}
}