package spira.layouts
{
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	
	import flash.utils.setTimeout;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class Tutorial extends Sprite
	{
		private var tutoCircle:MovieClip;
		private var tutoPrevious:Button;
		private var tutoNext:Button;
		private var tutoClose:Button;
		private var timeline:TimelineMax;
		
		public var textures:*;
		private var lineOne:TextField;
		
		[Embed(source="../media/fonts/Interstate-Light.otf", 
			embedAsCFF="false",
			fontFamily="Interstate",
			mimeType = "application/x-font" )]
		public static var Interstate:Class;
		private var count:int;
		
		public function Tutorial(textures:* = null)
		{
			this.textures = textures;
			super();
			addEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded():void
		{
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
			addEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoved);
			
			initialize();
		}
		
		private function initialize():void
		{
			count = 0;
			
			trace('initialize');
			tutoCircle = new MovieClip( textures.circle,30 );
			addChild(tutoCircle);
			tutoCircle.pivotX = tutoCircle.width/2;
			tutoCircle.pivotY = tutoCircle.height/2;
			tutoCircle.x = 1024/2;
			tutoCircle.y = 768/2;
			tutoCircle.loop = false;
			
			tutoPrevious = new Button(textures.previous);
			addChild(tutoPrevious);
			tutoPrevious.pivotX = tutoPrevious.width/2;
			tutoPrevious.pivotY = tutoPrevious.height/2;
			tutoPrevious.x = 450;
			tutoPrevious.y = 666;
			tutoPrevious.alpha = 0;
			
			tutoNext = new Button(textures.next);
			addChild(tutoNext);
			tutoNext.pivotX = tutoNext.width/2;
			tutoNext.pivotY = tutoNext.height/2;
			tutoNext.x = 574;
			tutoNext.y = 666;
			tutoNext.alpha = 0;
			 
			tutoClose = new Button(textures.close);
			addChild(tutoClose);
			tutoClose.pivotX = tutoNext.width/2;
			tutoClose.pivotY = tutoClose.height/2;
			tutoClose.x = 512;
			tutoClose.y = 666;
			tutoClose.alpha = 0;
			
			lineOne = new TextField(100, 20, "text", "Interstate", 14, 0x222222);
			addChild(lineOne);
			lineOne.x = 1024/2;
			lineOne.y = 768/2;
			lineOne.pivotX = lineOne.width/2;
			lineOne.pivotY = lineOne.height/2;
			lineOne.hAlign = HAlign.CENTER;  // horizontal alignment
			lineOne.vAlign = VAlign.CENTER; // vertical alignment
			lineOne.alpha = 1;
			
			// TWEENS
			
			timeline = new TimelineMax({onComplete:tweenInComplete});
			timeline.insert(new TweenMax(tutoPrevious,0.8,{alpha:0.5}));
			timeline.insert(new TweenMax(tutoNext,0.8,{alpha:1}));
			timeline.insert(new TweenMax(tutoClose,0.8,{alpha:1}));
			timeline.stop();
			setTimeout(function():void{
				Starling.juggler.add(tutoCircle);
			},1000);
			tutoCircle.addEventListener(Event.COMPLETE, startTweenIn);
			function startTweenIn():void
			{
				trace('start tween in');
				timeline.play();
			}
			//timeline.insert(new TweenMax();
		}
		
		private function tweenInComplete():void{
			tutoPrevious.addEventListener(TouchEvent.TOUCH, onPrevious);
			tutoNext.addEventListener(TouchEvent.TOUCH, onNext);
			tutoClose.addEventListener(TouchEvent.TOUCH, onClose);
		}
		
		private function onClose(evt:TouchEvent):void
		{
			
			var touch:Touch = evt.getTouch(this, TouchPhase.ENDED);
			if( touch ){
				trace('clicked close');
				// TWEENS OUT
				tutoClose.removeEventListener(TouchEvent.TOUCH, onClose);
				var tm:TimelineMax = new TimelineMax({onComplete:TweenOutComplete});
				tm.insert(new TweenMax(tutoPrevious, 0.8, {alpha: 0}));
				tm.insert(new TweenMax(tutoNext, 0.8, {alpha: 0}));
				tm.insert(new TweenMax(tutoClose, 0.8, {alpha: 0}));
				tm.insert(new TweenMax(tutoCircle, 0.8, {alpha: 0}));
				tm.play();
			}
		}
		private function TweenOutComplete():void
		{
			this.dispatchEvent(new Event("tutorialClose",true));
		};
		
		private function onNext(evt:TouchEvent):void
		{
			var touch:Touch = evt.getTouch(this, TouchPhase.ENDED);
			if( touch ){
				tutoNext.removeEventListener(TouchEvent.TOUCH, onNext);
				trace('clicked next');
			}
		}
		
		private function onPrevious(evt:TouchEvent):void
		{
			var touch:Touch = evt.getTouch(this, TouchPhase.ENDED);
			if( touch ){
				trace('clicked previous');
				tutoPrevious.removeEventListener(TouchEvent.TOUCH, onPrevious);
			}
		}
		
		private function onRemoved():void
		{			
			removeChild(tutoCircle);
			removeChild(tutoNext);
			removeChild(tutoPrevious);
			removeChild(tutoCircle);
			removeChild(lineOne);
			super.dispose();
		}
	}
}