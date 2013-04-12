package screens
{	
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import events.NavigationEvent;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.media.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.setTimeout;
	
	import objects.GameBackground;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;

	public class InGame extends Sprite
	{
		
		private var bigTitle:Image;
		
		private var titleRythme:Image;
		private var titlePercu:Image;
		private var titleMelo:Image;
		
		private var samplePickerOne:Image;
		private var samplePickerTwo:Image;
		private var samplePickerThree:Image;
		private var curseurOne:Image;
		private var curseurTwo:Image;
		private var curseurThree:Image;
		
		
		private var puceRythme:Button;
		private var puceMelo:Button;
		private var pucePercu:Button;
		
		
		private var loader:Image;
		
		
		private var soundOne:Sound;
		private var soundChannelOne:SoundChannel;
		private var urlRequestOne:URLRequest;
		
		private var soundTwo:Sound;
		private var soundChannelTwo:SoundChannel;
		private var urlRequestTwo:URLRequest;
		
		private var soundThree:Sound;
		private var soundChannelThree:SoundChannel;
		private var urlRequestThree:URLRequest;
		
		private var soundOneIsPlayed:Boolean = false;
		private var soundTwoIsPlayed:Boolean = false;
		private var soundThreeIsPlayed:Boolean = false;
		
		private var puceLeft:Image;
		private var puceRight:Image;
		private var logo:Image;
		
		

		
		private var firstPosition:Point;
		private var lastPosition:Point;
		
		private var compteur:int = 1;
		private var fontMusique:Image;
		private var pentaground:Image;
		private var aPuce:Image;
		
		
		private var loadHelix:Image;
		
		private var textCreateBadge:Image;
		private var myByteArray:ByteArray = new ByteArray();
		private var isTweened:Boolean = new Boolean(false);
		
		
		[Embed(source='../media/sounds/samples/percuTribal.mp3')]
		private const percuTribal:Class;
		
		[Embed(source='../media/sounds/samples/basseFunky.mp3')]
		private const basseFunky:Class;
		
		[Embed(source='../media/sounds/samples/pianoFunky.mp3')]
		private const pianoFunky:Class;
		
		
		public function InGame()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			drawScreen();
		}
		private function drawScreen():void
		{
			fontMusique = new Image(Assets.getTexture("fondMusique"));
			fontMusique.width = 1024;
			fontMusique.height = 768;
			fontMusique.alpha = 0.7;
			addChild(fontMusique);
			
			bigTitle = new Image(Assets.getAtlas().getTexture("bigTitle"));
			bigTitle.pivotX = bigTitle.width/2;
			bigTitle.pivotY = bigTitle.height/2;
			bigTitle.scaleX = 0.4;
			bigTitle.scaleY = 0.4;
			bigTitle.x = 1024/2;
			bigTitle.y = 75;
			bigTitle.alpha = 0;
			addChild(bigTitle);
			
			TweenMax.to(bigTitle, 1,{alpha:1, ease: Cubic.easeOut});
			
			
			
			logo = new Image(Assets.getAtlas().getTexture("logo"));
			logo.height = 64/2;
			logo.width = 64/2;
			logo.pivotX = logo.width/2;
			logo.pivotY = logo.height/2;
			logo.x = 1024/2 - 15;
			logo.y = 13;
			logo.alpha = 0;
			addChild(logo);
			
			TweenMax.to(logo, 1,{alpha:1, ease: Cubic.easeOut});
			
			
			
			titlePercu = new Image(Assets.getAtlas().getTexture("text_percussions"));
			titlePercu.width = 156/2;
			titlePercu.height = 17/2;
			titlePercu.pivotX = titlePercu.width;
			titlePercu.pivotY = titlePercu.height/2;
			titlePercu.x = 1900/2;
			titlePercu.y = 700/2;
			titlePercu.alpha = 1;
			addChild(titlePercu);
			
			
			titleRythme = new Image(Assets.getAtlas().getTexture("text_rythme"));
			titleRythme.width = 90/2;
			titleRythme.height = 17/2;
			titleRythme.pivotX = titleRythme.width;
			titleRythme.pivotY = titleRythme.height/2;
			titleRythme.x = 1900/2;
			titleRythme.y = 768/2;
			titleRythme.alpha = 1;
			addChild(titleRythme);
			
			TweenMax.to(titleRythme,2 ,{alpha:1});
			
			titleMelo = new Image(Assets.getAtlas().getTexture("text_melo"));
			titleMelo.width = 98/2;
			titleMelo.height = 23/2;
			titleMelo.pivotX = titleMelo.width;
			titleMelo.pivotY = titleMelo.height/2;
			titleMelo.x = 1900/2;
			titleMelo.y = (768 + 68) /2;
			titleMelo.alpha = 1;
			addChild(titleMelo);
			
			loadHelix = new Image(Assets.getAtlas().getTexture("createBadge"));
			addChild(loadHelix);
			loadHelix.width = 201/2;
			loadHelix.height = 201/2;
			loadHelix.pivotX = loadHelix.width/2;
			loadHelix.pivotY = loadHelix.height/2;
			loadHelix.x = (1024/2) - 27;
			loadHelix.y = 1300/2 - 20;
			loadHelix.alpha = 0.8;
			
			textCreateBadge = new Image(Assets.getAtlas().getTexture("text_badgeWizardiiii"));
			addChild(textCreateBadge);
			textCreateBadge.width = 237/2;
			textCreateBadge.height = 29/2;
			textCreateBadge.pivotX = textCreateBadge.width/2;
			textCreateBadge.pivotY = textCreateBadge.height/2;
			textCreateBadge.x = (1024/2) - 27;
			textCreateBadge.y = (1445/2) - 20;
			textCreateBadge.alpha = 0;
			
			loadHelix.addEventListener(TouchEvent.TOUCH, onLoader);
			drawGame();
			
		}
		
		private function drawGame():void
		{
			// INIT SOUNDS
			soundOne = new percuTribal();
			soundTwo = new basseFunky();
			soundThree = new pianoFunky();
			
			

			
			pentaground= new Image(Assets.getAtlas().getTexture("pentagoneBackground"));
			pentaground.width = 351;
			pentaground.height = 351;
			pentaground.pivotX = pentaground.width/2;
			pentaground.pivotY = pentaground.height/2;
			pentaground.x = 1024/2 - 87;
			pentaground.y = 768/2 - 89;
			addChild(pentaground);
			
			

			
			samplePickerOne = new Image(Assets.getAtlas().getTexture("pentagone"));
			trace(samplePickerOne.width, samplePickerOne.height);
			samplePickerOne.width = 673/2;
			samplePickerOne.height = 626/2;
			samplePickerOne.pivotX = samplePickerOne.width/2;
			samplePickerOne.pivotY = samplePickerOne.height/2;
			samplePickerOne.x = 1024/2 -85;
			samplePickerOne.y = 768/2 - 95;
			samplePickerOne.alpha = 1;
			addChild(samplePickerOne);
			
			samplePickerTwo = new Image(Assets.getAtlas().getTexture("pentagone"));
			samplePickerTwo.width = 673/2;
			samplePickerTwo.height = 626/2;
			samplePickerTwo.pivotX = samplePickerTwo.width/2;
			samplePickerTwo.pivotY = samplePickerTwo.height/2;
			samplePickerTwo.x = 1024/2 - 85;
			samplePickerTwo.y = 768/2 - 95 + 768;
			samplePickerTwo.alpha = 1;
			addChild(samplePickerTwo);
			
			samplePickerThree = new Image(Assets.getAtlas().getTexture("pentagone"));
			samplePickerThree.width = 673/2;
			samplePickerThree.height = 626/2;
			samplePickerThree.pivotX = samplePickerThree.width/2;
			samplePickerThree.pivotY = samplePickerThree.height/2;
			samplePickerThree.x = 1024/2 - 85;
			samplePickerThree.y = 768/2 - 95 + 768 + 768;
			samplePickerThree.alpha = 1;
			addChild(samplePickerThree);
			
			
			// position du curseur sur le click de lutilisateur (ou le drag)
			curseurOne = new Image(Assets.getAtlas().getTexture("cursor"));
			curseurOne.pivotX = curseurOne.width/2;
			curseurOne.pivotY = curseurOne.height/2;
			curseurOne.alpha = 1;
			addChild(curseurOne);
			
			// position du curseur sur le click de lutilisateur (ou le drag)
			curseurTwo = new Image(Assets.getAtlas().getTexture("cursor"));
			curseurTwo.pivotX = curseurTwo.width/2;
			curseurTwo.pivotY = curseurTwo.height/2;
			curseurTwo.alpha = 1;
			addChild(curseurTwo);
			
			// position du curseur sur le click de lutilisateur (ou le drag)
			curseurThree = new Image(Assets.getAtlas().getTexture("cursor"));
			curseurThree.pivotX = curseurThree.width/2;
			curseurThree.pivotY = curseurThree.height/2;
			curseurThree.alpha = 1;
			addChild(curseurThree);


			
			this.addEventListener(Event.ENTER_FRAME, readSpectrum);
			fontMusique.addEventListener(TouchEvent.TOUCH, isPressed);
			samplePickerOne.addEventListener(TouchEvent.TOUCH, onSamplePickerOne);
			samplePickerTwo.addEventListener(TouchEvent.TOUCH, onSamplePickerTwo);
			samplePickerThree.addEventListener(TouchEvent.TOUCH, onSamplePickerThree);
		}
		
		private function isPressed(event:TouchEvent):void
		{
			var touchBegan:Touch = event.getTouch(fontMusique, TouchPhase.BEGAN);
			if (touchBegan)
			{
				var localPosBegan:Point = touchBegan.getLocation(fontMusique);
				firstPosition = localPosBegan;
			}
			var touchMoved:Touch = event.getTouch(fontMusique, TouchPhase.MOVED);
			if (touchMoved)
			{
				var localPosMoved:Point = touchMoved.getLocation(fontMusique);
				lastPosition = localPosMoved;
			}
			var touchEnd:Touch = event.getTouch(fontMusique, TouchPhase.ENDED);
			if(touchEnd)
			{
				var localPosEnd:Point = touchEnd.getLocation(fontMusique);
				if(firstPosition && lastPosition)
				{
					if(firstPosition.y < lastPosition.y)
					{
						trace('down');
						goToDown();
					}
					else if(firstPosition.y > lastPosition.y)
					{
						trace('up');
						goToUp();
					}
				}
			}
			
		}
		
		private function goToUp():void
		{
			// MOVEMENTS
			TweenMax.to(samplePickerOne, 0.3,{ y: samplePickerOne.y + 768});
			TweenMax.to(curseurOne, 0.3,{ y: curseurOne.y + 768});
			
			TweenMax.to(samplePickerTwo, 0.3, { y: samplePickerTwo.y + 768});
			TweenMax.to(curseurTwo, 0.3, {y: curseurTwo.y + 768});
			
			TweenMax.to(samplePickerThree, 0.3, { y: samplePickerThree.y + 768});
			TweenMax.to(curseurThree, 0.3, {y: curseurThree.y + 768});
			
			// DISPLAYS
			/*TweenMax.to(samplePickerOne, 0.3,{ y: samplePickerOne.y + 768});
			TweenMax.to(curseurOne, 0.3,{ y: curseurOne.y + 768});
			
			TweenMax.to(samplePickerTwo, 0.3, { y: samplePickerTwo.y + 768});
			TweenMax.to(curseurTwo, 0.3, {y: curseurTwo.y + 768});
			
			TweenMax.to(samplePickerThree, 0.3, { y: samplePickerThree.y + 768});
			TweenMax.to(curseurThree, 0.3, {y: curseurThree.y + 768});*/
			
		}
		
		private function goToDown():void
		{
			TweenMax.to(samplePickerOne, 0.3,{ y: samplePickerOne.y - 768});
			TweenMax.to(curseurOne, 0.3,{ y: curseurOne.y - 768});
			
			TweenMax.to(samplePickerTwo, 0.3, { y: samplePickerTwo.y - 768});
			TweenMax.to(curseurTwo, 0.3, {y: curseurTwo.y - 768});
			
			TweenMax.to(samplePickerThree, 0.3, { y: samplePickerThree.y - 768});
			TweenMax.to(curseurThree, 0.3, {y: curseurThree.y - 768});
			
		}
		
		private function onButtonHold(event:TouchEvent):void
		{
			var  touch:Touch = event.getTouch(this);
			var localPos:Point = touch.getLocation(this);
			trace("Touched object at position: " + localPos.x,localPos.y );
		}
		
		private function GotoRight(event:TouchEvent):void
		{
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
		
			if (touch)
			{
				var localPos:Point = touch.getLocation(this);
				trace("Touched object at position: " + localPos.x,localPos.y );
				
				titleRythme.visible = false;
				
				TweenMax.to(samplePickerOne, 0.3,{ y: samplePickerOne.y - 768});
				TweenMax.to(curseurOne, 0.3,{ y: curseurOne.y - 768});
				
				TweenMax.to(samplePickerTwo, 0.3, { y: samplePickerTwo.y - 768});
				TweenMax.to(curseurTwo, 0.3, {y: curseurTwo.y - 768});
				
				TweenMax.to(samplePickerThree, 0.3, { y: samplePickerThree.y - 768});
				TweenMax.to(curseurThree, 0.3, {y: curseurThree.y - 768});
			}
			
		}
		
		// TODO
		private function GotoLeft():void
		{
			// TODO Auto Generated method stub
			
		}	
		private function onSamplePickerOne(event:TouchEvent):void
		{
			var touchBegan:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if(touchBegan)
			{
				if(soundOneIsPlayed === true){
					soundChannelOne.stop();
					soundOneIsPlayed = false;
				}
				if(soundTwoIsPlayed === true){
					soundChannelTwo.stop();
					soundTwoIsPlayed = false;
				}
				
				if(soundThreeIsPlayed === true){
					soundChannelThree.stop();
					soundThreeIsPlayed = false;
				}
				
				var localPos:Point = touchBegan.getLocation(this);
				curseurOne.x = localPos.x;
				curseurOne.y = localPos.y;
			}
			
			var touchMove:Touch = event.getTouch(this, TouchPhase.MOVED);
			if(touchMove)
			{
				var localPosOne:Point = touchMove.getLocation(this);
				curseurOne.x = localPosOne.x;
				curseurOne.y = localPosOne.y;
				
			}
			
			var touchEnd:Touch = event.getTouch(this, TouchPhase.ENDED);
			if(touchEnd)
			{
				if(soundOneIsPlayed == false)
				{
					soundChannelOne = soundOne.play();
					soundOneIsPlayed = true;
					trace('start sample');
				}
				
			}
		}
		private function onSamplePickerTwo(event:TouchEvent):void
		{
			// TOUCH BEGAN
			var touchBegan:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if (touchBegan)
			{
				if(soundOneIsPlayed === true){
					soundChannelOne.stop();
					soundOneIsPlayed = false;
				}
				
				if(soundTwoIsPlayed === true){
					soundChannelTwo.stop();
					soundTwoIsPlayed = false;
				}
				
				if(soundThreeIsPlayed === true){
					soundChannelThree.stop();
					soundThreeIsPlayed = false;
				}
				var localPos:Point = touchBegan.getLocation(this);
				curseurTwo.x = localPos.x;
				curseurTwo.y = localPos.y;
			}
			
			
			// TOUCH MOVED
			var touchMove:Touch = event.getTouch(this, TouchPhase.MOVED);
			if(touchMove)
			{
				var localPosTwo:Point = touchMove.getLocation(this);
				curseurTwo.x = localPosTwo.x;
				curseurTwo.y = localPosTwo.y;
				
			}
			
			//  TOUCH MOVED
			var touchEnd:Touch = event.getTouch(this, TouchPhase.ENDED);
			if(touchEnd)
			{
				if(soundTwoIsPlayed == false)
				{
					soundChannelTwo = soundTwo.play();
					soundTwoIsPlayed = true;
				}
			}
		}
		private function onSamplePickerThree(event:TouchEvent):void
		{
			
			// TOUCH BEGAN
			var touchBegan:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if (touchBegan)
			{
				if(soundOneIsPlayed === true){
					soundChannelOne.stop();
					soundOneIsPlayed = false;
				}
				
				if(soundTwoIsPlayed === true){
					soundChannelTwo.stop();
					soundTwoIsPlayed = false;
				}
				
				if(soundThreeIsPlayed === true){
					soundChannelThree.stop();
					soundThreeIsPlayed = false;
				}
				
				var localPosThree:Point = touchBegan.getLocation(this);
				curseurThree.x = localPosThree.x;
				curseurThree.y = localPosThree.y;
			}
			
			
			// TOUCH MOVED
			var touchMove:Touch = event.getTouch(this, TouchPhase.MOVED);
			if(touchMove)
			{
				var localPos:Point = touchMove.getLocation(this);
				curseurThree.x = localPos.x;
				curseurThree.y = localPos.y;
				
			}
			
			//  TOUCH MOVED
			var touchEnd:Touch = event.getTouch(this, TouchPhase.ENDED);
			if(touchEnd)
			{
				if(soundThreeIsPlayed == false)
				{
					soundChannelThree = soundThree.play();
					soundThreeIsPlayed = true;
				}
			}
		}

		private function onLoader(event:TouchEvent):void
		{
			var touchHover:Touch = event.getTouch(this, TouchPhase.HOVER);
			if(touchHover)
			{
				TweenMax.to(textCreateBadge, 0.5, {alpha: 1});
			}
			else{
				TweenMax.to(textCreateBadge, 0.5, {alpha: 0});
				
			}
			var touchEnd:Touch = event.getTouch(this, TouchPhase.ENDED);
			if(touchEnd)
			{
				if(soundOneIsPlayed === true){
					soundChannelOne.stop();
					soundOneIsPlayed = false;
				}
				if(soundTwoIsPlayed === true){
					soundChannelTwo.stop();
					soundTwoIsPlayed = false;
				}
				
				if(soundThreeIsPlayed === true){
					soundChannelThree.stop();
					soundThreeIsPlayed = false;
				}
				trace('go to the other page');
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,{id: "view"}, true));
			}
		}

		public function disposeTemporarily():void
		{
			this.visible = false;
		}
	
		public function initialize():void
		{
			this.visible = true;
			trace('init inGame');
		}
			
		// animation des steps
		private function drawStep(step:String):void
		{
			switch(step)
			{
				case "one":
					TweenMax.to(samplePickerOne,2 ,{alpha:1});
					TweenMax.to(samplePickerTwo,2 ,{alpha:1});
					TweenMax.to(samplePickerThree,2 ,{alpha:1});
					break;
				case "two":
					break;
				case "three":
					break;
			}
		}
		private function readSpectrum(event:Event):void
		{
			
			SoundMixer.computeSpectrum(myByteArray, false, 0);
			
			
			for(var i:int = 0; i < 256; i += 8){
				
				drawSpectrum(myByteArray.readFloat(), i);
				
			}	
		}
		
		private function drawSpectrum(myReadFloat:Number, myIteration:Number):void
		{
			
			var myNumber:Number = myReadFloat * 500;
			
			if(!isTweened && myNumber > 50)
			{
				isTweened = true;
				
				TweenMax.to(fontMusique, 0.05, {alpha:1});
				var intervalId:uint = setTimeout(startTheTweenEnd, 500);
			}
			/*
			shape.graphics.lineStyle(1, 0x000000);
			shape.graphics.beginFill(0xffffff);
			shape.graphics.drawRect((16 * (myIteration / 8)) +19, 250, 16, -(myNumber / 5));*/
		}
		private function startTheTweenEnd():void
		{
			TweenMax.to(fontMusique, 0.05 ,{alpha:0.7, onComplete:stopTheTween});
		}
		private function stopTheTween():void
		{
			isTweened = false;
		}
	
		
	}
}