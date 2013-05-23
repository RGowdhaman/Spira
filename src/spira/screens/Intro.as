package spira.screens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.mikesoylu.fortia.*;
	
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	
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
		private var touchScreen:Image;
		
		private var timeline:TimelineMax;
		
		private var introManager:fAssetManager;
		
		public function Intro()
		{
			super();
			addEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
		}
		/**
		 * TODO: 
		 *	Clear dirty code:
		 *	resolve fAssetManager for xml error fix
		 *	import osunds with fAssetmanager
		 * 
		 *
		 * 
		 */
		private function onAdded(event:Event):void
		{
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
			addEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoved);
			
			// load assets
			introManager = new fAssetManager();
			introManager.enqueue(IntroSprite);
			introManager.loadQueue(initialize);
			
			function initialize():void{
				drawScene();								// DRAW SCENE
				trace('DISPATCH:: ASSET LOADED');
				TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.ASSET_LOADED));
			}
			
			trace('ADD:: TRANSITION IN');
			TransitionManager.addEventListener(TransitionManagerEvent.TRANSITION_IN, addEffects);
			
			trace('ADD:: TRANSITION OUT');
			TransitionManager.addEventListener(TransitionManagerEvent.TRANSITION_OUT, removeEffects);
		}
		
		private function drawScene():void
		{
			// first loader
			loader = new FirstLoader(introManager.getTextures("loader_"),30);
			addChild(loader);
			loader.x = 1024/2;
			loader.y = 768/2;
			loader.loop = false;
			Starling.juggler.add(loader);
			
			// SMOOTHY SPIRA
			welcome = new MovieClip(introManager.getTextures("spiraLogo_"), 30);
			addChild(welcome);
			welcome.loop = false;
			
			welcome.pivotX = welcome.width / 2;
			welcome.pivotY = welcome.height / 2;
			welcome.x = 1024/2;
			welcome.y = 768/2;
			
			touchScreen = new Image(introManager.getTexture('txt_touchScreen'));
			addChild(touchScreen);
			touchScreen.y = 576;
			touchScreen.x = 512;
			touchScreen.pivotX = touchScreen.width/2;
			touchScreen.pivotY = touchScreen.height/2;
			touchScreen.alpha = 0;
			
		}
		
		private function addEffects():void
		{
			trace('REMOVE:: TRANSITION IN');
			TransitionManager.removeEventListener(TransitionManagerEvent.TRANSITION_IN, addEffects);
			// ADD CALLBACK FOR tweenInComplete
			
			// Tween In element
			timeline = new TimelineMax();
			timeline.insert(new TweenMax(loader, 0.6, {y: 192, ease: Quad.easeOut}),2);
			
			setTimeout(function():void{
				Starling.juggler.add(welcome);
			},2000);
			
			timeline.insert(new TweenMax(touchScreen, 1, {alpha:1, repeat:-1, yoyo:true}), 4);
			timeline.stop();
			timeline.play();
			setTimeout(tweenInComplete, 4000);
		}		
		
		private function removeEffects():void
		{
			trace('REMOVE:: TRANSITION OUT');
			TransitionManager.removeEventListener(TransitionManagerEvent.TRANSITION_OUT, removeEffects);
			// Tween OUT element
			welcome.stop();
			var tween:TweenMax = TweenMax.fromTo(welcome,4, {frame:1}, {frame:welcome.numFrames, ease:Linear.easeNone, useFrames:true, paused:true});

			var tm:TimelineMax = new TimelineMax();
			tm.stop();
			tm.insert(new TweenMax(loader, 0.4,{alpha:0}));
			tm.insert(new TweenMax(touchScreen, 0.4, {alpha:0}));
			tm.insert(tween);
			tm.play();
			
			setTimeout(tweenOutComplete, 2000);
			
			//tm.insert(new TweenMax());
			
			/*
			var tm:TimelineMax = new TimelineMax({onComplete:tweenOutComplete});
			tm.insert(new TweenMax(loader, 1.4, {y: -100, ease: Cubic.easeInOut}), 0);
			tm.insert(new TweenMax(welcome, 0, {callback: function():void{
				Starling.juggler.add(welcome);
			}}), 1.4);
			*/
			
		}
		
		private function tweenOutComplete():void
		{
			removeChild(loader);
			removeChild(welcome);
			removeChild(touchScreen);
			trace('DISPATCH:: TRANSITION OUT COMPLETE');
			TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.TRANSITION_OUT_COMPLETE));
		}
		
		private function tweenInComplete():void{
			trace('DISPATCH::  TRANSITION IN COMPLETE');
			TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.TRANSITION_IN_COMPLETE));
			
			trace('ADD TOUCH');
			// touch on stage
			stage.addEventListener(TouchEvent.TOUCH, touchStage);
		}
		
		
		private function touchStage(evt:TouchEvent):void
		{
			var touch:Touch = evt.getTouch(stage, TouchPhase.BEGAN);
			if( touch ){
				stage.removeEventListener(TouchEvent.TOUCH, touchStage);
				trace('DISPATCH:: CHANGE_SCREEN');
				dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, false, {view: 'composer'}));
			}
		}
		
		private function onRemoved():void
		{
			// Tween Out element
			introManager.destroy();
			super.dispose();
			//fAssetManager.destroy();
		}
	}
}