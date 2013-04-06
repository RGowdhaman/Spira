package screens
{	
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import events.NavigationEvent;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	import objects.GameBackground;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	public class InGame extends Sprite
	{
		
		
		
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
		
		
		private var soundOne:Sound;
		private var soundChannelOne:SoundChannel;
		private var urlRequestOne:URLRequest;
		
		private var loader:Image;
		
		
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
		
		private var compteur:int = 1;
		
		
		
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
			drawGame();
		}
		private function drawGame():void
		{
			
			soundOne = new percuTribal();
			soundTwo = new basseFunky();
			soundThree = new pianoFunky();
			
			
			
			
			titleRythme = new Image(Assets.getAtlas().getTexture("text_rythme_x2"));
			titleRythme.pivotX = titleRythme.width/2;
			titleRythme.pivotY = titleRythme.height/2;
			titleRythme.x = 1024/2;
			titleRythme.y = 270/2;
			titleRythme.alpha = 0;
			addChild(titleRythme);
			
			TweenMax.to(titleRythme,2 ,{alpha:1});
			
			
			titleMelo = new Image(Assets.getAtlas().getTexture("text_melo_x2"));
			titleMelo.pivotX = titleMelo.width/2;
			titleMelo.pivotY = titleMelo.height/2;
			titleMelo.x = 1024/2;
			titleMelo.y = 270/2;
			titleMelo.alpha = 0;
			addChild(titleMelo);
			
			titlePercu = new Image(Assets.getAtlas().getTexture("text_percu_x2"));
			titlePercu.pivotX = titlePercu.width/2;
			titlePercu.pivotY = titlePercu.height/2;
			titlePercu.x = 1024/2;
			titlePercu.y = 270/2;
			titlePercu.alpha = 0;
			addChild(titlePercu);
			
			
			
			samplePickerOne = new Image(Assets.getAtlas().getTexture("samplePicker_x2"));
			samplePickerOne.pivotX = samplePickerOne.width/2;
			samplePickerOne.pivotY = samplePickerOne.height/2;
			samplePickerOne.x = 1024/2;
			samplePickerOne.y = 768/2;
			samplePickerOne.alpha = 1;
			addChild(samplePickerOne);
			
			
			samplePickerTwo = new Image(Assets.getAtlas().getTexture("samplePicker_x2"));
			samplePickerTwo.pivotX = samplePickerTwo.width/2;
			samplePickerTwo.pivotY = samplePickerTwo.height/2;
			samplePickerTwo.x = 1024;
			samplePickerTwo.y = 768/2
			samplePickerTwo.alpha = 1;
			addChild(samplePickerTwo);
			
			samplePickerThree = new Image(Assets.getAtlas().getTexture("samplePicker_x2"));
			samplePickerThree.pivotX = samplePickerThree.width/2;
			samplePickerThree.pivotY = samplePickerThree.height/2;
			samplePickerThree.x = (2048 - 512);
			samplePickerThree.y = 768/2;
			samplePickerThree.alpha = 1;
			addChild(samplePickerThree);
			
			
			loader = new Image(Assets.getAtlas().getTexture("loader_x2"));
			loader.pivotX = loader.width/2;
			loader.pivotY = loader.height/2;
			loader.x = 2048;
			loader.y = 768/2;
			loader.alpha = 1;
			addChild(loader);
			
			
			// position du curseur sur le click de lutilisateur (ou le drag)
			curseurOne = new Image(Assets.getAtlas().getTexture("cursor_x2"));
			curseurOne.pivotX = curseurOne.width/2;
			curseurOne.pivotY = curseurOne.height/2;
			curseurOne.alpha = 1;
			addChild(curseurOne);
			
			// position du curseur sur le click de lutilisateur (ou le drag)
			curseurTwo = new Image(Assets.getAtlas().getTexture("cursor_x2"));
			curseurTwo.pivotX = curseurTwo.width/2;
			curseurTwo.pivotY = curseurTwo.height/2;
			curseurTwo.alpha = 1;
			addChild(curseurTwo);
			
			// position du curseur sur le click de lutilisateur (ou le drag)
			curseurThree = new Image(Assets.getAtlas().getTexture("cursor_x2"));
			curseurThree.pivotX = curseurThree.width/2;
			curseurThree.pivotY = curseurThree.height/2;
			curseurThree.alpha = 1;
			addChild(curseurThree);
			
			
			
			
			// position du curseur sur le click de lutilisateur (ou le drag)
			puceLeft = new Image(Assets.getAtlas().getTexture("puceOff_x2"));
			puceLeft.pivotX = puceLeft.width/2;
			puceLeft.pivotY = puceLeft.height/2;
			puceLeft.alpha = 0.3;
			puceLeft.x = 10;
			puceLeft.y = 700;
			
			puceLeft.addEventListener(TouchEvent.TOUCH, GotoLeft);
			
			puceRight = new Image(Assets.getAtlas().getTexture("puceOff_x2"));
			puceRight.pivotX = puceRight.width/2;
			puceRight.pivotY = puceRight.height/2;
			puceRight.alpha = 0.3;
			puceRight.height = 75;
			puceRight.width = 75;
			puceRight.x = 512;
			puceRight.y = 600;
			addChild(puceRight);
			
			puceRight.addEventListener(TouchEvent.TOUCH, GotoRight);
			
			
			
			samplePickerOne.addEventListener(TouchEvent.TOUCH, onSamplePickerOne);
			samplePickerTwo.addEventListener(TouchEvent.TOUCH, onSamplePickerTwo);
			samplePickerThree.addEventListener(TouchEvent.TOUCH, onSamplePickerThree);
			loader.addEventListener(TouchEvent.TOUCH, onLoader);
		}
		
		private function GotoRight(event:TouchEvent):void
		{
			
			var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
			if (touch)
			{
				titleRythme.visible = false;
				
				TweenMax.to(samplePickerOne, 0.3,{ x: samplePickerOne.x - 1024/2});
				TweenMax.to(curseurOne, 0.3,{ x: curseurOne.x - 1024/2});
				
				TweenMax.to(samplePickerTwo, 0.3, {x: samplePickerTwo.x - 1024/2});
				TweenMax.to(curseurTwo, 0.3, {x: curseurTwo.x - 1024/2});
				
				TweenMax.to(samplePickerThree, 0.3, {x: samplePickerThree.x - 1024/2});
				TweenMax.to(curseurThree, 0.3, {x: curseurThree.x - 1024/2});
				
				TweenMax.to(loader, 0.3, {x: loader.x - 1024/2});
			}
		
				
			
		}
		
		private function GotoLeft():void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onSamplePickerOne(event:TouchEvent):void
		{
			
			
			var touchMove:Touch = event.getTouch(this, TouchPhase.MOVED);
			if(touchMove)
			{
				var localPos:Point = touchMove.getLocation(this);
				trace(localPos.x, localPos.y);
				curseurOne.x = localPos.x;
				curseurOne.y = localPos.y;
				
			}
			if(soundOneIsPlayed === true){
				soundChannelOne.stop();
				soundOneIsPlayed = false;
			}
			
			
			var touchEnd:Touch = event.getTouch(this, TouchPhase.ENDED);
			if(touchEnd)
			{
				
				soundChannelOne = soundOne.play();
				soundOneIsPlayed = true;
			
				trace('start sample');
			}
		}
		private function onSamplePickerTwo(event:TouchEvent):void
		{
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if (touch)
			{
				var localPos:Point = touch.getLocation(this);
				curseurTwo.x = localPos.x;
				curseurTwo.y = localPos.y;
				trace("Touched object at position: " + localPos.x);
			}
			var touchEnd:Touch = event.getTouch(this, TouchPhase.ENDED);
			if(touchEnd)
			{
				soundChannelOne.stop();
				soundOneIsPlayed = false;
				
				soundChannelOne = soundTwo.play();
				soundTwoIsPlayed = true;
			
				trace('start sample');
			}
		}
		
		private function onSamplePickerThree(event:TouchEvent):void
		{
			
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if (touch)
			{
				var localPos:Point = touch.getLocation(this);
				curseurThree.x = localPos.x;
				curseurThree.y = localPos.y;
				trace("Touched object at position: " + localPos.x);
			}
			var touchEnd:Touch = event.getTouch(this, TouchPhase.ENDED);
			if(touchEnd)
			{
				soundChannelOne.stop();
				soundChannelTwo = soundThree.play();
				soundThreeIsPlayed = true;
				
				trace('start sample');
			}
		}
		
		private function onLoader(event:TouchEvent):void
		{
			var touchEnd:Touch = event.getTouch(this, TouchPhase.ENDED);
			if(touchEnd)
			{
				soundChannelOne.stop();
				soundChannelTwo.stop();
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
			drawStep("one")	;
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
	}
}