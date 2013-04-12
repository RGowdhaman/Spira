package
{
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import events.NavigationEvent;
	
	import screens.Helix;
	import screens.InGame;
	import screens.Welcome;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		private var screenWelcome:Welcome;
		private var screenInGame:InGame;
		private var screenMandala:Helix;
		private var bigTitle:Image;
		
		private var background:Image;
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage );	
		}
		private function onAddedToStage(event:Event):void
		{
			background = new Image(Assets.getTexture('splashScreen'));
			this.addChild(background);			
			
			// title
			bigTitle = new Image(Assets.getAtlas().getTexture("bigTitle"));
			bigTitle.pivotX = bigTitle.width/2;
			bigTitle.pivotY = bigTitle.height/2;
			bigTitle.x = (2048/2) / 2;
			bigTitle.y = (1536/2) / 2 - 100;
			bigTitle.scaleY = 0.9;
			bigTitle.scaleX = 0.9;
			bigTitle.alpha = 0;
			this.addChild(bigTitle);
			
			
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			
			//  SET ALL SCREENS
			// PLACE HERE SCREENS APP TO DISPOSE (HIDE) TO PREPARE THE STAGE
			screenInGame = new InGame();
			screenInGame.disposeTemporarily();
			this.addChild(screenInGame);
			
			screenMandala = new Helix();
			screenMandala.disposeTemporarily();
			this.addChild(screenMandala);
			
			
			screenWelcome = new Welcome();
			this.addChild(screenWelcome);
			screenWelcome.initialize();
			TweenMax.to(bigTitle, 4, {alpha: 1, ease:Cubic.easeOut});
			TweenMax.to(bigTitle, 1, {scaleX: 1, scaleY:1, ease:Cubic.easeInOut});
		}
		
		
		// MANAGE APP SCREENS 
		
		private function onChangeScreen(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				// set tweens here just before loading view
				case "play":
					TweenMax.to(bigTitle, 1, {alpha:0, onComplete: function():void{
						screenWelcome.disposeTemporarily();
						screenInGame.initialize();
					}, ease: Quad.easeOut});
					break;
				case "view":
					TweenMax.to(bigTitle, 1, {alpha:0, onComplete: function():void{
						screenInGame.disposeTemporarily();
						screenWelcome.disposeTemporarily();
						screenMandala.initialize();
					}, ease:Quad.easeOut});
					break;
				case "welcome":
					screenInGame.disposeTemporarily();
					screenMandala.disposeTemporarily();
					screenWelcome.initialize();
					TweenMax.to(bigTitle, 2, {alpha: 1, ease:Quad.easeOut});
					break;
			}
		}
		
	}
}