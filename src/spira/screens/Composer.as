package spira.screens
{
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Ease;
	import com.greensock.easing.Elastic;
	import com.mikesoylu.fortia.fAssetManager;
	
	import flash.utils.setTimeout;
	
	import spira.assets.Intro.ComposerSprite;
	import spira.events.TransitionManager;
	import spira.events.TransitionManagerEvent;
	
	import starling.core.Starling;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Composer extends Sprite
	{
		private var forme:Shape;
		public function Composer()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded():void
		{
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
			addEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoved);
			
			
			setTimeout(initialize, 100);
			
			//fAssetManager.enqueue(ComposerSprite);
			
			// start loading the assets
			//fAssetManager.loadQueue(initialize);
			
			function initialize():void{
				drawScene();
				TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.ASSET_LOADED));
				
			}
			
			trace('ADD LISTENER : TRANSITION_IN');
			TransitionManager.addEventListener(TransitionManagerEvent.TRANSITION_IN, addEffects);
			TransitionManager.addEventListener(TransitionManagerEvent.TRANSITION_OUT, removeEffects);

		}
		
		private function addEffects():void
		{
			trace('bebsdbf');
			TransitionManager.removeEventListener(TransitionManagerEvent.TRANSITION_IN, addEffects);
			trace(Starling.current.nativeStage.stageWidth, forme.width);
			
			var tm:TimelineMax = new TimelineMax({onComplete: tweenInComplete});
			tm.append(new TweenMax(
				forme, 
				1.3, {
					alpha: 1, 
					x: (int(Starling.current.nativeStage.stageWidth - forme.width) /2),
					ease: Bounce.easeOut
				}));
			tm.play();
					
			trace('COMPOSER TRANSITION IN');

		}
		
		private function tweenInComplete():void{
			trace('INTRO :: DISPATCH TRANSITION IN COMPLETE');
			TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.TRANSITION_IN_COMPLETE));
		}
		
		private function removeEffects():void
		{
			
			// effacer le contenu de la scene
			TransitionManager.dispatchEvent(new TransitionManagerEvent(TransitionManagerEvent.TRANSITION_OUT_COMPLETE));
		}		
		
		
		private function drawScene():void
		{
			forme = new Shape();
			forme.graphics.beginFill(0xFF0000, 1);
			forme.graphics.drawRect(100, 100, 30, 30);
			forme.graphics.endFill();
			forme.alpha = 1;
			forme.y = int(Starling.current.nativeStage.stageHeight - forme.height) /2;
			forme.x = - 100;
			addChild(forme);
			
		}
		
		private function onRemoved():void
		{
			// Tween Out element
			super.dispose();
			//fAssetManager.destroy();
		}
	}
}