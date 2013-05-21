package screens
{
	
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Graphics;
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.GradientTexture;
	import starling.textures.Texture;
	import flash.geom.Point;
	
	public class Intro extends Sprite
	{	
		private var bg:Image;
		private var title:Image;
		private var hero:Image;
		
		private var tstartMaking:Button;
		private var tviewMandala:Button;
		
		private var startMaking:Button;
		private var viewMandala:Button;
		private var background:Image;
		private var bigTitle:Image;
		
		
		public function Intro()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event:Event):void
		{
			drawScreen();
		}
		
		// fill assets content before initialize animation on load view
		private function drawScreen():void
		{
			trace('drawscreen intro');
			// button creer un badge
			startMaking = new Button(Assets.getAtlas().getTexture("bt_badgeWizard"));
			startMaking.pivotX = startMaking.width/2;
			startMaking.pivotY = startMaking.height/2;
			startMaking.x = 820/2;
			startMaking.y = 850/2;
			startMaking.scaleX = 0;
			startMaking.scaleY = 0;
			this.addChild(startMaking);
			
			// button text badge
			tstartMaking = new Button(Assets.getAtlas().getTexture("text_badgeWizard"));
			tstartMaking.pivotX = tstartMaking.width/2;
			tstartMaking.pivotY = tstartMaking.height/2;
			tstartMaking.x = 820/2;
			tstartMaking.y = 1000/2;
			tstartMaking.alpha = 0;
			this.addChild(tstartMaking);
			
			
			// button text animation
			viewMandala = new Button(Assets.getAtlas().getTexture("bt_animation"));
			viewMandala.pivotX = viewMandala.width/2;
			viewMandala.pivotY = viewMandala.height/2;
			viewMandala.x = 1220/2;
			viewMandala.y = 850/2;
			viewMandala.scaleX = 0;
			viewMandala.scaleY = 0;
			this.addChild(viewMandala);
			
			tviewMandala = new Button(Assets.getAtlas().getTexture("text_animation"));
			tviewMandala.pivotX = tviewMandala.width/2;
			tviewMandala.pivotY = tviewMandala.height/2;
			tviewMandala.x = 1220/2;
			tviewMandala.y = 1000/2;
			tviewMandala.alpha = 0;
			this.addChild(tviewMandala);
			/*
			var polygon:Polygon = new Polygon(100,5, 0x00FF00); // radius, edges, color
			polygon.x = 512;
			trace('width :', polygon.width,'height :', polygon.height);
			polygon.pivotX = polygon.width/2;
			polygon.pivotY = polygon.height/2;
			trace('pivotX :', polygon.pivotX,'pivotY :', polygon.pivotY);
			polygon.rotation = 72;
			
			polygon.y = 384;
			polygon.scaleX = 0.5;
			polygon.scaleY = 0.5;
			addChild(polygon);
			*/
			
			
			
			//TweenMax.to(polygon, 2, {alpha:0.5, rotation:360});
			//TweenMax.to(polygon, 1, {scaleX: 1, scaleY: 1, ease:Circ.easeOut});
			
			// LISTENERS
			// listen all click event triggered by the welcome page
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
		}
		
		private function onMainMenuClick(event:Event):void
		{
			// get the button clicked
			var buttonClicked:Button = event.target as Button;
			if(buttonClicked as Button == startMaking)
			{
				hideButtons();
				this.removeEventListener(Event.TRIGGERED, onMainMenuClick);
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,{id: "compositing"}, true));
			}
			
			if(buttonClicked as Button == viewMandala)
			{
				hideButtons();
				this.removeEventListener(Event.TRIGGERED, onMainMenuClick);
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,{id: "helix"}, true));
			}
		}
		
		public function hideButtons():void
		{
			TweenMax.to(viewMandala, 1, {alpha:0});
			TweenMax.to(tviewMandala, 1, {alpha:0});
			TweenMax.to(startMaking, 1, {alpha:0});
			TweenMax.to(tstartMaking, 1, {alpha:0});
		}

		public function disposeTemporarily():void
		{
			this.visible = false;
			
			if (this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, btnAnimAnimation);
				
		}
		
		// this function is called everytime this screen is active
		public function initialize():void
		{
			this.visible = true;
			trace('init intro');
			
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
			
			TweenMax.to(viewMandala, 1, {scaleX:1, delay: 0.5, scaleY:1, alpha:1, ease:Cubic.easeInOut});
			TweenMax.to(startMaking, 1, {scaleX:1, delay: 0.5, scaleY:1, alpha:1, ease:Cubic.easeInOut});
			
			TweenMax.to(tviewMandala, 0.5, {alpha:1, delay:1, ease:Cubic.easeInOut});
			TweenMax.to(tstartMaking, 0.5, {alpha:1, delay:1, ease:Cubic.easeInOut});
			
			this.addEventListener(Event.ENTER_FRAME, btnAnimAnimation);	
		}
		
		private function btnAnimAnimation(event:Event):void
		{
			var currentDate:Date = new Date();
			
		}

	}
}