package spira.screens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.mikesoylu.fortia.*;
	
	import spira.assets.Composer.BackgroundLight;
	import spira.assets.Composer.HudSprite;
	import spira.assets.Composer.TutoSprite;
	
	import spira.events.NavigationEvent;
	import spira.events.TransitionManager;
	import spira.events.TransitionManagerEvent;
	
	import spira.layouts.Hud;
	import spira.layouts.Tutorial;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Composer extends Sprite
	{	
		private var timeline:TimelineMax;
		
		private var composerManager:fAssetManager;
		private var tutorial:Tutorial;
		private var hud:Hud;
		
		
		public function Composer()
		{
			super();
			addEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
		}
		/**
		* TODO: 
		*	
		*
		* 
		*/
		private function onAdded(event:Event):void
		{
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
			addEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoved);
			
			// load assets
			composerManager = new fAssetManager();
			composerManager.enqueue(TutoSprite);
			composerManager.enqueue(HudSprite);
			composerManager.enqueue(BackgroundLight);
			composerManager.loadQueue(initialize);
			
			function initialize():void{
				drawScene();											// DRAW SCENE
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
			loadTutorial();
			
		}
		
		private function loadHud():void{
			hud = new Hud({
				help: composerManager.getTexture('help'),
				mix: composerManager.getTexture('hud_mix'),
				melodies: composerManager.getTexture('hud_melodies'),
				percussions: composerManager.getTexture('hud_percussions'),
				rythmes: composerManager.getTexture('hud_rythmes'),
				circle: composerManager.getTextures('tutoCercle'),
				previous: composerManager.getTexture("tutoPrevious"),
				next: composerManager.getTexture("tutoNext"),
				close: composerManager.getTexture("tutoClose"),
				backgroundA: composerManager.getTexture('backgroundLight_faceA'),
				backgroundB: composerManager.getTexture('backgroundLight_faceB'),
				backgroundC: composerManager.getTexture('backgroundLight_faceC'),
				backgroundD: composerManager.getTexture('backgroundLight_faceD'),
				backgroundE: composerManager.getTexture('backgroundLight_faceE')
			});
			addChild(hud);
		}
		private function loadTutorial():void{
			trace('TUTORIAL INIT');
			tutorial = new Tutorial({
				circle: composerManager.getTextures('tutoCercle'),
				previous: composerManager.getTexture("tutoPrevious"),
				next: composerManager.getTexture("tutoNext"),
				close: composerManager.getTexture("tutoClose")
			});
			addChild(tutorial);
			tutorial.addEventListener("tutorialClose", onTutorialClose);
			addEffects();
		}
		
		private function addEffects():void
		{
			trace('REMOVE:: TRANSITION IN');
			TransitionManager.removeEventListener(TransitionManagerEvent.TRANSITION_IN, addEffects);
			// ADD CALLBACK FOR tweenInComplete by setTimeout or TweenMax onComplete
			
		}		
		
		private function onTutorialClose():void
		{
			tutorial.removeEventListener("tutorialClose", onTutorialClose);
			removeChild(tutorial);
			loadHud();
		}	
		
		private function removeEffects():void
		{
			trace('REMOVE:: TRANSITION OUT');
			TransitionManager.removeEventListener(TransitionManagerEvent.TRANSITION_OUT, removeEffects);
			// ADD CALLBACK FOR tweenInComplete by setTimeout or TweenMax onComplete
			
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
			// REMOVE ALL ITEMS BEFORE
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
			var touch:Touch = evt.getTouch(this, TouchPhase.ENDED);
			if( touch ){
				removeEventListener(TouchEvent.TOUCH, touchStage);
				trace('DISPATCH:: CHANGE_SCREEN');
				dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, false, {view: 'composer'}));
			}
		}
		
		private function onRemoved():void
		{
			composerManager.destroy();
			super.dispose();
		}
	}
}