package screens.game
{
	
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import events.NavigationEvent;
	
	import flash.geom.Point;
	import flash.media.*;
	import flash.media.Sound;
	import flash.net.*;
	import flash.utils.ByteArray;
	
	import models.Pentagone;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.SpritePool;
	
	public class Compositing extends Sprite
	{
		
		private var pentagone:Pentagone;
		
		private var pentaList:Array;
		private var selectionText:Array;
		
		
		private var firstPosition:Point;
		private var lastPosition:Point;
		
		private var slideSelected:int = 0;
		private var fontMusique:Image;
		private var composeHelix:Image;
		
		
		
		
		
		
		
		private var lineThickness : Number = 2;
		private var lineColor : Number = 0x993300;
		private var circleSize : Number = 75;
		private var scaleOnBeat:Number = 1.1; // 110%
		private var reactToBeat:Number = 30;
		
		private var music : Sound;
		private var mainChannel:SoundChannel;
		private var ba : ByteArray;
		
		
		
		public function Compositing()
		{
			super();
			
			fontMusique = new Image(Assets.getTexture("fondMusique"));
			trace(fontMusique.width,fontMusique.height);
			fontMusique.pivotX = fontMusique.width/2;
			fontMusique.pivotY = fontMusique.height/2;
			fontMusique.x = 1024/2;
			fontMusique.y = 768/2;
			fontMusique.alpha = 0;
			addChild(fontMusique);
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, added);
		}
		
		private function added():void
		{
			// def pentagone array 
			pentaList = new Array();
			var defaultY:int = 384 - 95;
			for (var i:int = 0; i < 3; i++) 
			{
				if(i == 0) 
				{
					pentagone = new Pentagone(1);
					pentagone.addListeners();
				}
				else
				{
					pentagone = new Pentagone();
				}
				
				pentagone.pentagone.y = defaultY;
				pentagone.cursor.y = defaultY;
				pentagone.alpha = 0;
				pentagone.show();
				pentaList.push(pentagone);
				addChild(pentagone);
				defaultY = defaultY + 600;
			}
			TweenMax.to(fontMusique, 1, {alpha: 1});
			fontMusique.addEventListener(TouchEvent.TOUCH, onClick);
			
			
			// def selectionText array
			selectionText = new Array();
			
			//Compose Helix
			
			composeHelix = new Image(Assets.getAtlas().getTexture("bt_animation"));
			composeHelix.pivotX = composeHelix.width/2;
			composeHelix.pivotY = composeHelix.height/2;
			composeHelix.x = 512;
			composeHelix.y = 720;
			composeHelix.alpha = 1;
			addChild(composeHelix);
			
			composeHelix.addEventListener(TouchEvent.TOUCH, onClickCompose);
			
			// TODO: RYHTM / MELO / PERCU
			ba = new ByteArray();
			fontMusique.addEventListener(Event.ENTER_FRAME, readSpectrum);
		}
		
		private function onClick(event:TouchEvent):void
		{
			var touchBegan:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if (touchBegan)
			{
				var localPosBegan:Point = touchBegan.getLocation(this);
				firstPosition = localPosBegan;
			}
			var touchMoved:Touch = event.getTouch(this, TouchPhase.MOVED);
			if (touchMoved)
			{
				var localPosMoved:Point = touchMoved.getLocation(this);
				lastPosition = localPosMoved;
			}
			var touchEnd:Touch = event.getTouch(this, TouchPhase.ENDED);
			if(touchEnd)
			{
				var localPosEnd:Point = touchEnd.getLocation(this);
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
		
		//down to up
		private function goToUp():void
		{
			if(slideSelected >= pentaList.length -1) return;
			if(pentaList[0].tweenIsFinished == false) return;
			
			slideSelected = slideSelected +1;
			for (var i:int = 0; i < pentaList.length; i++) 
			{
				if(i == slideSelected) 
				{
					pentaList[i].translatePentagone("up", 1);
					pentaList[i].addListeners();
				}
				else
				{
					pentaList[i].removeListeners();
					pentaList[i].translatePentagone("up");
				}
			}
			trace('slideSelected: ', slideSelected);
			
		}
		
		// up to down
		private function goToDown():void
		{
			if(slideSelected == 0) return;
			if(pentaList[0].tweenIsFinished == false) return;
			slideSelected = slideSelected -1;
			for (var i:int = 0; i < pentaList.length; i++) 
			{
				if(i == slideSelected)
				{
					pentaList[i].translatePentagone("down", 1);
					pentaList[i].addListeners();
				}
				else
				{
					pentaList[i].removeListeners();
					pentaList[i].translatePentagone("down");
				}
			}
			trace('slideSelected: ', slideSelected);
		}
		
		public function disposeTemporarily():void
		{
			for(var i:int; i< pentaList.length; i++)
			{
				TweenMax.to(pentaList[i].pentagone, 1, {alpha: 0});
				TweenMax.to(pentaList[i].cursor, 1, {alpha: 0});
			}
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
			trace('init Compositing');
		}
		
		private function onClickCompose(event:TouchEvent):void
		{
			// add here when all pentagone is choosen, enable button "composeHelix"
			var touchEnd:Touch = event.getTouch(this, TouchPhase.ENDED);
			if(touchEnd)
			{
				
				trace('go to the other page');
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,{id: "helix"}, true));
			}
		}
		
		
		private function readSpectrum(ev : Event) : void {
			SoundMixer.computeSpectrum( ba, true, 0 );
			var vol : Number = 0;
			var val : Number = 0;
			for (var i : uint = 0; i <512 ; i++) {
				var lev : Number = ba.readFloat( );
				
				vol += lev;
				val = vol * 0.1;
				
				//trace('vol: ', val, 'lev : ', lev);
				var a : uint = i;

					fontMusique.scaleY = val;
					fontMusique.scaleX = val;
				
				
				// Rect drawn with drawRect()
				//graphics.lineTo( -Math.sin( i / 256 * Math.PI ) * circleSize * (lev + 1), Math.cos( a / 256 * Math.PI ) * circleSize * (lev + 1) );
			}
		}
	}
}