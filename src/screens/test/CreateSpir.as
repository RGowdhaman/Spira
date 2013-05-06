package screens.test
{
	
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import flash.media.*;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.setTimeout;
	
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class CreateSpir extends Sprite
	{
		[Embed(source='../media/sounds/samples/pianoFunky.mp3')]
		private const percuTribal:Class;
		
		private var myByteArray:ByteArray = new ByteArray();
		private var isTweened:Boolean = new Boolean(false);
		private var soundOne:Sound;
		private var soundChannelOne:SoundChannel;
		private var urlRequestOne:URLRequest;
		private var shape:Shape = new Shape();
		
		private var soundOneIsPlayed:Boolean = false;
		
		
		private var testShape:Image;
		
		
		
		
		public function CreateSpir()
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
			trace('ok createSpir');
			
			initialize();
			testShape = new Image(Assets.getAtlas().getTexture("loader"));
			testShape.pivotX = testShape.width/2;
			testShape.pivotY = testShape.height/2;
			testShape.x = 512;
			testShape.y = 384;
			testShape.alpha = 1;
			addChild(testShape);
		}
		
		private function initialize():void
		{
			// TODO Auto Generated method stub
			soundOne = new percuTribal();
			soundChannelOne = soundOne.play();
			this.addEventListener(Event.ENTER_FRAME, readSpectrum);
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
			
			if(!isTweened && myNumber > 100)
			{
				isTweened = true;
				
				TweenMax.to(testShape, 0.05, {scaleX: 1.1, scaleY:1.1});
				var intervalId:uint = setTimeout(startTheTweenEnd, 500);
			}
			/*
			shape.graphics.lineStyle(1, 0x000000);
			shape.graphics.beginFill(0xffffff);
			shape.graphics.drawRect((16 * (myIteration / 8)) +19, 250, 16, -(myNumber / 5));*/
		}
		private function myDelayedFunction():void
		{
			testShape.scaleY = 1;
			testShape.scaleX = 1;
			isTweened = false;
			
		}
		private function startTheTweenEnd():void
		{
			TweenMax.to(testShape, 0.05 ,{scaleX:1, scaleY: 1, onComplete:stopTheTween});
		}
		private function stopTheTween():void
		{
			isTweened = false;
		}
	}
}