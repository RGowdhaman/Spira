package screens
{
	import com.greensock.*;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	
	import events.NavigationEvent;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	public class Helix extends Sprite
	{
		private var finalm:Image;
		private var btnBack:Image;
		
		[Embed(source='../media/sounds/samples/percuTribal.mp3')]
		private const percuTribal:Class;
		
		[Embed(source='../media/sounds/samples/basseFunky.mp3')]
		private const basseFunky:Class;
		
		[Embed(source='../media/sounds/samples/pianoFunky.mp3')]
		private const pianoFunky:Class;
		private var soundOne:Sound;
		private var soundTwo:Sound;
		private var soundThree:Sound;
		private var soundChannelOne:SoundChannel;
		private var soundChannelTwo:SoundChannel;
		private var soundChannelThree:SoundChannel;
		public function Helix()
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
			trace('draw screen on mandalaaaa')
			soundOne = new percuTribal();
			soundTwo = new basseFunky();
			soundThree = new pianoFunky();
			// position du curseur sur le click de lutilisateur (ou le drag)
			finalm = new Image(Assets.getAtlas().getTexture("final"));
			finalm.pivotX = finalm.width/2;
			finalm.pivotY = finalm.height/2;
			finalm.x = 1024/2;
			finalm.y = 768/2;
			finalm.alpha = 1;
			addChild(finalm);
			
			

			btnBack = new Image(Assets.getAtlas().getTexture("createBadge"));
			btnBack.pivotX = btnBack.width/2;
			btnBack.pivotY = btnBack.height/2;
			btnBack.alpha = 0.3;
			btnBack.height = 201/2;
			btnBack.width = 201/2;
			btnBack.x = 1024/2;
			btnBack.y = 1400/2;
			addChild(btnBack);
		
			
			btnBack.addEventListener(TouchEvent.TOUCH, backToMenu);
		}
		
		private function backToMenu(event:TouchEvent):void
		{	
			var touchBegan:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if(touchBegan)
			{
				trace('backto menu');
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,{id: "intro"}, true));				
			}			
		}
		
		public function disposeTemporarily():void
		{
			trace('dispose mandala');
			this.visible = false;
		}
		public function initialize():void
		{
			
			soundChannelOne = soundOne.play();
			soundChannelTwo = soundTwo.play();
			soundChannelThree = soundThree.play();
			
			trace('mandala init');
			this.visible = true;
			TweenMax.to(finalm,16,{rotation:35200, ease:Circ.easeOut});

			
			
		}
	}
}