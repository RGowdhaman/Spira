package
{
	import events.NavigationEvent;

	import com.greensock.*;
	
	import com.greensock.easing.*;
	import screens.InGame;
	import screens.Mandala;
	import screens.Welcome;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	// my main class game
	public class Game extends Sprite
	{
		private var screenWelcome:Welcome;
		private var screenInGame:InGame;
		private var screenMandala:Mandala;
		private var bigTitle:Image;
		
		private var background:Image;
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage );	
		}
		private function onAddedToStage(event:Event):void
		{
			trace('framework initialized');
			
			background = new Image(Assets.getTexture('splashScreen'));
			trace(background.pivotY, background.pivotX);
			this.addChild(background);			
			
			// title
			bigTitle = new Image(Assets.getTexture("bigTitle"));
			bigTitle.pivotX = bigTitle.width/2;
			bigTitle.pivotY = bigTitle.height/2;
			bigTitle.x = 1024/2;
			bigTitle.y = 650/2;
			bigTitle.scaleY = 0;
			bigTitle.scaleX = 0;
			bigTitle.alpha = 0;
			this.addChild(bigTitle);
			
			
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			
			//  SET ALL SCREENS
			// PLACE HERE SCREENS APP TO DISPOSE (HIDE) TO PREPARE THE STAGE
			screenInGame = new InGame();
			screenInGame.disposeTemporarily();
			this.addChild(screenInGame);
			
			screenMandala = new Mandala();
			screenMandala.disposeTemporarily();
			this.addChild(screenMandala);
			
			
			screenWelcome = new Welcome();
			this.addChild(screenWelcome);
			screenWelcome.initialize();
			TweenMax.to(bigTitle, 1, {alpha: 1, scaleX: 1, scaleY:1, ease:Cubic.easeInOut});
		}
		
		
		// MANAGE APP SCREENS 
		private function onChangeScreen(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				case "play":
					TweenMax.to(bigTitle, 1, {y:150, scaleX:0.3, scaleY: 0.3, onComplete: function():void{
						screenWelcome.disposeTemporarily();
						screenInGame.initialize();
					}, ease: Expo.easeOut});
					break;
				case "view":
					TweenMax.to(bigTitle, 1, {y:150,scaleX:0.3, scaleY: 0.3, onComplete: function():void{
						screenInGame.disposeTemporarily();
						screenWelcome.disposeTemporarily();
						screenMandala.initialize();
					}, ease:Expo.easeOut});
					break;
				case "welcome":
					screenWelcome = new Welcome();
					this.addChild(screenWelcome);
					screenWelcome.initialize();
					TweenMax.to(bigTitle, 1, {alpha: 1, scaleX: 1, scaleY:1, ease:Cubic.easeInOut});
					break;
			}
		}
		
	}
}