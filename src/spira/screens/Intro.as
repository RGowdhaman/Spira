package spira.screens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.mikesoylu.fortia.*;
	
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	
	import spira.assets.Intro.Background;
	import spira.assets.Intro.IntroSprite;
	import spira.entities.FirstLoader;
	import spira.events.NavigationEvent;
	import spira.events.TransitionManager;
	import spira.events.TransitionManagerEvent;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Intro extends Sprite
	{	
		private var loader:FirstLoader;
		private var welcome:MovieClip;
		private var background:Image;
		
		public function Intro()
		{
			super();
	
			addEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
		}
		private function onAdded(event:Event):void
		{
			/*
			TODO: 
			Clear dirty code:
			resolve fAssetManager for xml error fix
			import osunds with fAssetmanager
			
			*/
			
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
			addEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoved);
			
			
			fAssetManager.enqueue(IntroSprite);
			
			// start loading the assets
			fAssetManager.loadQueue(initialize);
			
			function initialize():void{
				drawScene();
				TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.ASSET_LOADED));
			}
			
			trace('ADD LISTENER : TRANSITION_IN');
			TransitionManager.addEventListener(TransitionManagerEvent.TRANSITION_IN, addEffects);
			TransitionManager.addEventListener(TransitionManagerEvent.TRANSITION_OUT, removeEffects);
			
			// touch on stage
			stage.addEventListener(TouchEvent.TOUCH, touchStage);
		}
		
		private function drawScene():void
		{
			
			trace('DISPATCHED ASSET_LOADED');
			
			loader = new FirstLoader(fAssetManager.getTextures("loader_"),25);
			
			loader.x = 1024/2;
			loader.y = 768/2;
			loader.alpha = 0;
			loader.loop = false;
			addChild(loader);
			
			
			welcome = new MovieClip(fAssetManager.getTextures("spiraLogo_"), 30);
			addChild(welcome);
			
			welcome.pivotX = welcome.width / 2;
			welcome.pivotY = welcome.height / 2;
			welcome.x = 1024/2;
			welcome.y = 768/2;
			

		}
		
		private function addEffects():void
		{
			TransitionManager.removeEventListener(TransitionManagerEvent.TRANSITION_IN, addEffects);
			trace('HERE');
			// Tween In element
			var tm:TimelineMax = new TimelineMax({onComplete:tweenInComplete});
			tm.insert(new TweenMax(loader, 2, {y: 192, alpha:1}), 0);
			tm.insert(new TweenMax(welcome, 1, {alpha: 1}), 2);
			Starling.juggler.add(loader);
			tm.play();
			
			/*setTimeout(function():void{
				Starling.juggler.add(loader);
				tm.play();
			}, 3000);*/
			
		}		
		
		private function removeEffects():void
		{
			TransitionManager.removeEventListener(TransitionManagerEvent.TRANSITION_OUT, removeEffects);
			// Tween In element
			trace('INTRO :: ADD EVENT TRANSITION OUT');
			var tm:TimelineMax = new TimelineMax({onComplete:tweenOutComplete});
			tm.insert(new TweenMax(loader, 2, {y: -100}), 0);
			tm.insert(new TweenMax(welcome, 1, {alpha: 0}), 2);
			tm.play();


			/*setTimeout(function():void{
				Starling.juggler.add(loader);
				tm.play();
			}, 3000);*/
		}
		
		private function tweenOutComplete():void
		{
			trace('INTRO :: DISPATCH TRANSITION OUT COMPLETE');
			removeChild(loader);
			removeChild(welcome);
			TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.TRANSITION_OUT_COMPLETE));
		}
		
		private function tweenInComplete():void{
			trace(loader.alpha);
			trace('INTRO :: DISPATCH TRANSITION IN COMPLETE');
			TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.TRANSITION_IN_COMPLETE));
		}
		
		
		private function touchStage(evt:TouchEvent):void
		{
			var touch:Touch = evt.getTouch(this, TouchPhase.ENDED);
			if( touch ){
				removeEventListener(TouchEvent.TOUCH, touchStage);
				dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, false, {view: 'composer'}));
			}
		}
		
		private function onRemoved():void
		{
			// Tween Out element
			super.dispose();
			//fAssetManager.destroy();
		}
	}
}