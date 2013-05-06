package models
{
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import flash.events.Event;
	import flash.geom.Point;
	import flash.media.*;
	import flash.net.URLRequest;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	
	
	public class Pentagone extends Sprite
	{
		
		// pentagone main element
		private var _pentagone:Image;
		private var _cursor:Image;
		private var _typeSound:String;
		private var _trackSelected:Sound;
		
		private var mainChannel:SoundChannel;
		private var urlRequest:URLRequest;
		private var soundIsPlayed:Boolean = false;
		
		
		
		[Embed(source='../media/sounds/samples/percuTribal.mp3')]
		private const percuTribal:Class;
		
		[Embed(source='../media/sounds/samples/basseFunky.mp3')]
		private const basseFunky:Class;
		
		[Embed(source='../media/sounds/samples/pianoFunky.mp3')]
		private const pianoFunky:Class;
		
		// sounds type arrays
		private var percuArray:Array = new Array();
		private var rythmArray:Array = new Array();
		private var melodyArray:Array = new Array();
		
		// wing Array
		private var wingList:Array = new Array();
		private var touch:Touch;
		private var touchX:Number;
		private var touchY:Number;
		private var _tweenIsFinished:Boolean = true;
		
		public function Pentagone(alpha:Number = 0.3, type:String = "")
		{
			// define type of pentagone (melo, rythme, percu)
			if(type) this.typeSound = type;
			
			trackSelected = new percuTribal();
			
			/* TODO: 
			* 
			* 
			* 
			*/
			super();
			
			// pentagone
			pentagone = new Image(Assets.getAtlas().getTexture("pentagone"));
			pentagone.width = 673/2;
			pentagone.height = 626/2;
			pentagone.pivotX = pentagone.width/2;
			pentagone.pivotY = pentagone.height/2;
			pentagone.x = 512 -85;
			pentagone.y = 384 - 95;
			pentagone.alpha = alpha;
			addChild(pentagone);
			
			// cursor
			cursor = new Image(Assets.getAtlas().getTexture("cursor"));
			cursor.pivotX = cursor.width/2;
			cursor.pivotY = cursor.height/2;
			cursor.x = 512;
			cursor.y = 384;
			cursor.alpha = alpha;
			addChild(cursor);
			
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function get tweenIsFinished():Boolean
		{
			return _tweenIsFinished;
		}

		public function set tweenIsFinished(value:Boolean):void
		{
			_tweenIsFinished = value;
		}

		public function get cursor():Image
		{
			return _cursor;
		}

		public function set cursor(value:Image):void
		{
			_cursor = value;
		}

		public function get pentagone():Image
		{
			return _pentagone;
		}

		public function set pentagone(value:Image):void
		{
			_pentagone = value;
		}

		public function get typeSound():String
		{
			return _typeSound;
		}

		public function set typeSound(value:String):void
		{
			_typeSound = value;
		}

		public function get trackSelected():Sound
		{
			return _trackSelected;
		}

		public function set trackSelected(value:Sound):void
		{
			_trackSelected = value;
		}
			
		public function addListeners():void
		{
			pentagone.addEventListener(TouchEvent.TOUCH, onPentagoneClick);
			trace('pentagone is listened');
		}
		
		public function removeListeners():void
		{
			pentagone.removeEventListener(TouchEvent.TOUCH, onPentagoneClick);
			trace('pentagone listeners is removed');
		}
		
		public function translatePentagone(direction:String, alpha:Number = 0, pas:Number = 600):void
		{
			if(tweenIsFinished == false) return;
			tweenIsFinished = false;
			if("up" == direction)
			{
				TweenMax.to(pentagone, 0.7, {alpha:alpha, y: pentagone.y - pas,  ease: Quint.easeOut, onComplete:translateTweenFinished});
				TweenMax.to(cursor, 0.7, {alpha:alpha, y: pentagone.y - pas,  ease: Quint.easeOut});
				
			}else if("down" == direction)
			{
				TweenMax.to(pentagone, 0.7, {alpha:alpha, y: pentagone.y + pas,  ease: Quint.easeOut, onComplete:translateTweenFinished});
				TweenMax.to(cursor, 0.7, {alpha:alpha, y: cursor.y + pas,  ease: Quint.easeOut});
			}else{
				trace('bad direction string');
			}
		}
		
		private function translateTweenFinished():void
		{
			_tweenIsFinished = true;
			trace('tweenIsFInished');
		}
										   
			
		private function onAddedToStage(event:starling.events.Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);

			// loading elements
			TweenMax.to(pentagone, 1, {alpha: 1});
			TweenMax.to(cursor, 1, {alpha: 1});
		}
		
		private function onPentagoneClick(event:TouchEvent):void
		{
/*			switch(typeSound)
			{
				case "melodie":
					trace(typeSound, "loaded");
				break;
				case "rythme":
					trace(typeSound, "loaded");
				break;
				case "percussion":
					trace(typeSound, "loaded");
				break;
				default:
					trace("typeSound not found: ", typeSound);
			}*/
			
			var touchBegan:Touch = event.getTouch(pentagone, TouchPhase.BEGAN);
			if(touchBegan)
			{
				// check is a sound is played
				if(soundIsPlayed === true)
				{
					mainChannel.stop();
					soundIsPlayed = false;
				}
				
				cursor.x = touchBegan.globalX;
				cursor.y = touchBegan.globalY;
			}
			
			var touchMove:Touch = event.getTouch(pentagone, TouchPhase.MOVED);
			if(touchMove)
			{

				cursor.x = touchMove.globalX;
				cursor.y = touchMove.globalY;
				
				touchMove = touchMove;
			}
			
			var touchEnd:Touch = event.getTouch(pentagone, TouchPhase.ENDED);
			if(touchEnd)
			{	
				if(soundIsPlayed == false)
				{
					soundIsPlayed = true;
					mainChannel = trackSelected.play();
					mainChannel.addEventListener(flash.events.Event.SOUND_COMPLETE, isCompleted);
					//mainChannel.addEventListener(Event.SOUND_COMPLETE, isCompleted);
				}
			}
		}
		
		private function isCompleted(e:flash.events.Event):void
		{
			soundIsPlayed = false;
		}
		
		public function show():void
		{
			if(this.alpha < 1) 
			{
				
				trace('pentashow');
				TweenMax.to(this, 2.5, {alpha: 1});	
			}
		}
	}
}