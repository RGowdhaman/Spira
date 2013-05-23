package spira.layouts
{
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	
	import flash.utils.setTimeout;
	
	import spira.events.NavigationEvent;
	import spira.models.Pentagone;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Hud extends Sprite
	{
		private var timeline:TimelineMax;
		
		public var textures:*;
		private var helpButton:Button;
		private var mix:Image;
		private var percussions:Image;
		private var melodies:Image;
		private var rythmes:Image;
		private var tutorial:Tutorial;
		private var circleOne:Shape;
		private var progress:Sprite;
		private var circleTwo:Shape;
		private var circleThree:Shape;
		private var circleFour:Shape;
		private var firstLine:Shape;
		private var lineOne:Shape;
		private var lineThree:Shape;
		private var lineTwo:Shape;
		private var backgroundA:Image;
		private var pentagone:Pentagone;
		private var backgroundB:Image;
		private var backgroundC:Image;
		private var backgroundD:Image;
		private var backgroundE:Image;
		private var backgroundSelected:String;
		private var currentBackground:Image;
		private var pentaTm:TimelineMax;
		private var newBackground:Image;
		private var sameBackground:Boolean;
		private var oldBackground:Image;
		
		/**
		 * TODO: 
		 * Animate lineTo between circle 
		 * change to point vertex for HUD point
		 * Color picker for circle
		 * fix tween background change
		 * V3.0 tween video
		 * */
		public function Hud(textures:* = null)
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
			backgroundA = new Image(textures.backgroundA);
			addChild(backgroundA);
			backgroundA.alpha = 0;
			
			backgroundB = new Image(textures.backgroundB);
			addChild(backgroundB);
			backgroundB.alpha = 0;
			
			backgroundC = new Image(textures.backgroundC);
			addChild(backgroundC);
			backgroundC.alpha = 0;
			
			backgroundD = new Image(textures.backgroundD);
			addChild(backgroundD);
			backgroundD.alpha = 0;
			
			backgroundE = new Image(textures.backgroundE);
			addChild(backgroundE);
			backgroundE.alpha = 0;
			
			currentBackground = backgroundA;
			
			
			helpButton = new Button(textures.help);
			addChild(helpButton);
			helpButton.pivotX = helpButton.width/2;
			helpButton.pivotY = helpButton.height/2;
			
			helpButton.x = 935;
			helpButton.y = 40;
			helpButton.alpha = 0;
			
			mix = new Image(textures.mix);
			addChild(helpButton);
			mix.pivotX = helpButton.width/2;
			mix.pivotY = helpButton.height/2;
			mix.alpha = 1;
			
			percussions = new Image(textures.percussions);
			addChild(percussions);
			percussions.pivotX = percussions.width/2;
			percussions.pivotY = percussions.height/2;
			percussions.alpha = 1;
			
			melodies = new Image(textures.melodies);
			addChild(melodies);
			melodies.pivotX = melodies.width/2;
			melodies.pivotY = melodies.height/2;
			melodies.alpha = 1;
			
			rythmes = new Image(textures.melodies);
			addChild(rythmes);
			rythmes.pivotX = rythmes.width/2;
			rythmes.pivotY = rythmes.height/2;
			rythmes.alpha = 1;				

			drawTimeline();
			
			// TWEENS
			
			/*timeline = new TimelineMax({onComplete:tweenInComplete});
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
			*/
		}
		
		private function drawTimeline():void
		{
		
			// callback 

			lineOne = new Shape();
			addChild(lineOne);
			lineOne.graphics.lineStyle(1, 0x333333);
			lineOne.graphics.moveTo(320,41);
			lineOne.graphics.lineTo(448,41);
			lineOne.graphics.endFill();
			
			lineTwo = new Shape();
			addChild(lineTwo);
			lineTwo.graphics.lineStyle(1, 0x333333);
			lineTwo.graphics.moveTo(448,41);
			lineTwo.graphics.lineTo(576,41);
			lineTwo.graphics.endFill();
			
			lineThree = new Shape();
			addChild(lineThree);
			lineThree.graphics.lineStyle(1, 0x333333);
			lineThree.graphics.moveTo(576,41);
			lineThree.graphics.lineTo(704,41);
			lineThree.graphics.endFill();
			

			
			circleOne = new Shape();
			addChild(circleOne);
			
			circleOne.graphics.beginFill(0xA69471);
			circleOne.graphics.drawCircle(10,10,6);
			circleOne.x = 320;
			circleOne.y = 40;
			circleOne.pivotX = circleOne.width/2;
			circleOne.pivotY = circleOne.height/2;
			circleOne.graphics.endFill();
			
			circleTwo = new Shape();
			addChild(circleTwo);
			
			circleTwo.graphics.beginFill(0xA69471);
			circleTwo.graphics.drawCircle(10,10,6);
			circleTwo.x = 448;
			circleTwo.y = 40;
			circleTwo.pivotX = circleTwo.width/2;
			circleTwo.pivotY = circleTwo.height/2;
			circleTwo.graphics.endFill();
			
			circleThree = new Shape();
			addChild(circleThree);
			
			circleThree.graphics.beginFill(0xA69471);
			circleThree.graphics.drawCircle(10,10,6);
			circleThree.x = 576;
			circleThree.y = 40;
			circleThree.pivotX = circleThree.width/2;
			circleThree.pivotY = circleThree.height/2;
			circleThree.graphics.endFill();
			
			circleFour= new Shape();
			addChild(circleFour);
			
			circleFour.graphics.beginFill(0xA69471);
			circleFour.graphics.drawCircle(10,10,6);
			circleFour.x = 704;
			circleFour.y = 40;
			circleFour.pivotX = circleFour.width/2;
			circleFour.pivotY = circleFour.height/2;
			circleFour.graphics.endFill();

			timeline = new TimelineMax({onComplete: tweenInComplete});
			timeline.insert(new TweenMax(backgroundA, 2, {alpha: 1}));
			timeline.insert(new TweenMax(helpButton, 0.8, {alpha: 1}));
			
		}
		
		
		private function loadPentagone():void{
			trace('pentagone loaded');
			pentagone = new Pentagone();
			addChild(pentagone);
			pentagone.addEventListener(NavigationEvent.PENTAGONE_DATA, onPentagoneData);
		}
		
		private function onPentagoneData(e:NavigationEvent):void
		{
			sameBackground = false;
			
			oldBackground = currentBackground;
			
			pentagone.removeEventListener(NavigationEvent.PENTAGONE_DATA, onPentagoneData);
			var pentaSlideDuration:int = 0.3;
			trace(e.data.face);
			pentaTm = new TimelineMax({onComplete: changeBackground});
			pentaTm.stop();
			switch(e.data.face)
			{
				case 'A':
				{
					if(currentBackground == backgroundA) sameBackground = true;
					newBackground = backgroundA;
					break;
				}
				case 'B':
				{
					if(currentBackground == backgroundB) sameBackground = true;
					newBackground = backgroundB;
					break;
				}
				case 'C':
				{
					if(currentBackground == backgroundC) sameBackground = true;
					newBackground = backgroundC;
					break;
				}
				case 'D':
				{
					if(currentBackground == backgroundD) sameBackground = true;
					newBackground = backgroundD;
					break;
				}				
				case 'E':
				{
					if(currentBackground == backgroundE) sameBackground = true;
					newBackground = backgroundE;
					break;
				}
			}
			if(sameBackground){
				sameBackground = false;
				pentaTm.clear();
				pentagone.addEventListener(NavigationEvent.PENTAGONE_DATA, onPentagoneData);
			}else{
				trace('new background: ', newBackground);
				pentaTm.insert( new TweenMax(oldBackground,pentaSlideDuration, {alpha:0}) );
				pentaTm.insert( new TweenMax(newBackground,pentaSlideDuration, {alpha:1}) );
				pentaTm.play();
			}
			
		}
		
		private function changeBackground():void{
			pentaTm.clear();
			currentBackground = newBackground;
			trace('penta clear');
			pentagone.addEventListener(NavigationEvent.PENTAGONE_DATA, onPentagoneData);
		}
		
		private function tweenInComplete():void{
			/*
			
			tutoPrevious.addEventListener(TouchEvent.TOUCH, onPrevious);
			tutoNext.addEventListener(TouchEvent.TOUCH, onNext);
			tutoClose.addEventListener(TouchEvent.TOUCH, onClose);
			*/
			helpButton.addEventListener(TouchEvent.TOUCH, openTutorial);
			loadPentagone();
		}
		
		private function openTutorial(evt:TouchEvent):void
		{
			var touch:Touch = evt.getTouch(this, TouchPhase.ENDED);
			if( touch ){
				
				helpButton.removeEventListener(TouchEvent.TOUCH, openTutorial);
				tutorial = new Tutorial({
					circle: textures.circle,
					previous: textures.previous,
					next: textures.next,
					close: textures.close
				});
				addChild(tutorial);
				tutorial.addEventListener("tutorialClose", onTutorialClose);
			}
		}
		
		private function onTutorialClose():void
		{
			tutorial.removeEventListener("tutorialClose", onTutorialClose);
			
			helpButton.addEventListener(TouchEvent.TOUCH, openTutorial);
			removeChild(tutorial);
		}
		
		private function onClose(evt:TouchEvent):void
		{
			
			var touch:Touch = evt.getTouch(this, TouchPhase.ENDED);
			if( touch ){
				trace('clicked close');
				
				// TWEENS OUT
				/*
				var tm:TimelineMax = new TimelineMax({onComplete:TweenOutComplete});
				tm.insert(new TweenMax(tutoPrevious, 0.8, {alpha: 0}));
				tm.insert(new TweenMax(tutoNext, 0.8, {alpha: 0}));
				tm.insert(new TweenMax(tutoClose, 0.8, {alpha: 0}));
				tm.insert(new TweenMax(tutoCircle, 0.8, {alpha: 0}));
				tm.play();
				*/
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
				trace('clicked next');
			}
		}
		
		private function onPrevious(evt:TouchEvent):void
		{
			var touch:Touch = evt.getTouch(this, TouchPhase.ENDED);
			if( touch ){
				trace('clicked previous');
			}
		}
		
		private function onRemoved():void
		{	
			pentagone.addEventListener(NavigationEvent.PENTAGONE_DATA, onPentagoneData);
			removeChild(pentagone);
			super.dispose();
		}
	}
}