package screens.test
{
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import flash.geom.Point;
	
	import flashx.textLayout.formats.Float;
	
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.RectangleUtil;

	public class CreateSpi extends Sprite
	{
		
		// set scaleFActor for retina
		private var scaleFactor:int;
		
		
		private var wind:Shape = new Shape();
		private var windDeux:Shape = new Shape();
		private var windTrois:Shape = new Shape();
		private var windQuatre:Shape = new Shape();
		private var windCinq:Shape = new Shape();
		private var windSix:Shape = new Shape();
		private var windSept:Shape = new Shape();
		private var windHuit:Shape = new Shape();
		private var windNeuf:Shape = new Shape();
		private var windDix:Shape = new Shape();
		
		private var startX:Number = 512;
		private var startY:Number = 384;
		
		private var angleA:Number = 36;
		private var angleB:Number = 90;
		private var lengthOfSideC:Number = 200;
		
		private var windArray:Array = new Array();
		
		
		
		public function CreateSpi()
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
			
			var triangleHeight:uint = 100; 
			var triangle:Shape = new Shape(); 
			
/*			// red triangle, starting at point 0, 0 
			triangle.graphics.beginFill(0xFF0000); 
			triangle.graphics.moveTo(triangleHeight / 2, 0); 
			triangle.graphics.lineTo(triangleHeight, triangleHeight); 
			triangle.graphics.lineTo(0, triangleHeight); 
			triangle.graphics.lineTo(triangleHeight / 2, 0); */
			
			// green triangle, starting at point 200, 0 
/*			triangle.graphics.beginFill(0x00FF00); 
			triangle.graphics.moveTo(200 + triangleHeight / 2, 0); 
			triangle.graphics.lineTo(200 + triangleHeight, triangleHeight); 
			triangle.graphics.lineTo(200, triangleHeight); 
			triangle.graphics.lineTo(200 + triangleHeight / 2, 0); */
			
			
			var wind:Shape = new Shape();
			var windDeux:Shape = new Shape();
			var windTrois:Shape = new Shape();
			var windQuatre:Shape = new Shape();
			var windCinq:Shape = new Shape();
			var windSix:Shape = new Shape();
			var windSept:Shape = new Shape();
			var windHuit:Shape = new Shape();
			var windNeuf:Shape = new Shape();
			var windDix:Shape = new Shape();
			
			var windHeight:uint = 380;
			var centerScreenX:uint = 512;
			var centerScreenY:uint = 384;
			
			
		/*	wind.graphics.beginFill(0x27a275);
			wind.graphics.moveTo(centerScreenX, centerScreenY);
			wind.graphics.lineTo(centerScreenX, centerScreenY - 180);
			wind.graphics.lineTo(centerScreenX + 85, centerScreenY - 118);
			wind.graphics.lineTo(centerScreenX, centerScreenY );
			this.addChild(wind);
			*/
			
/*			wind.graphics.beginFill(0x27a275);
			wind.graphics.moveTo(centerScreenX, centerScreenY);
			wind.graphics.lineTo(centerScreenX, centerScreenY - 180);
			wind.graphics.lineTo(centerScreenX + 85, centerScreenY - 118);
			wind.graphics.lineTo(centerScreenX, centerScreenY );
			this.addChild(wind);*/
			
			
			/*wind.graphics.beginFill(0x27a275);
			wind.graphics.moveTo(384, 512);
			wind.graphics.lineTo(384, 512 + windHeight);
			wind.graphics.lineTo(884 + 133, 512 + windHeight + 180);
			wind.graphics.lineTo(884 + 384, 512 + windHeight);*/
			/*
			windDeux.graphics.beginFill(0x07b0a4);
			windDeux.graphics.moveTo(centerScreenX, centerScreenY);
			windDeux.graphics.lineTo(centerScreenX, centerScreenY - 180);
			windDeux.graphics.lineTo(centerScreenX - 85, centerScreenY - 118);
			windDeux.graphics.lineTo(centerScreenX, centerScreenY );
			this.addChild(windDeux);
			
			windTrois.graphics.beginFill(0x87c13a);
			windTrois.graphics.moveTo(centerScreenX, centerScreenY);
			windTrois.graphics.lineTo(centerScreenX + 85, centerScreenY - 118);
			windTrois.graphics.lineTo(centerScreenX + 168, centerScreenY - 60);
			windTrois.graphics.lineTo(centerScreenX, centerScreenY );
			this.addChild(windTrois);
			*/
			
			
			// définition angle
			/*var angleAInRadians:Number = angleInRaidans(angleA);
			var angleBInRadians:Number = angleInRaidans(angleB);
			var angleCInRadians:Number = angleInRaidans(180 - angleA - angleB);
			
			
			var lengthOfSideA:Number = Math.sin(angleAInRadians) * lengthOfSideC / Math.sin(angleCInRadians);
			var lengthOfSideB:Number = Math.sin(angleBInRadians) * lengthOfSideC / Math.sin(angleCInRadians);
			
			var g:Shape = new Shape();
			g.graphics.beginFill(0x07b0a4);
			g.graphics.moveTo(startX, startY);
			
			var bSideEndX:Number = (lengthOfSideB * Math.cos(angleBInRadians))+ startX;
			var bSideEndY:Number = (lengthOfSideB * Math.sin(angleBInRadians))+ startY;
			g.graphics.lineTo(bSideEndX, bSideEndY);
			
			var cSideEndX:Number = -(lengthOfSideC * Math.cos(angleCInRadians)) + startX;
			var cSideEndY:Number = (lengthOfSideC * Math.sin(angleCInRadians)) + startY;
			g.graphics.lineTo(cSideEndX, cSideEndY);
			
			g.graphics.lineTo(startX, startY);
			g.pivotX = g.width*2;
			g.pivotY = g.height*2;
			g.x = 512;
			g.y = 384;
			TweenMax.to(g, 2,{rotation:36});
			trace(g.width, g.height);
			this.addChild(g);*/
			
			this.addChild(wind);
			wind.graphics.beginFill(0x22B573);
			wind.graphics.moveTo(centerScreenX, centerScreenY);
			wind.graphics.lineTo(centerScreenX, 118);
			wind.graphics.lineTo(638, 209);
			wind.graphics.lineTo(centerScreenX, centerScreenY );
			wind.alpha = 0.2;
			wind.scaleX = 0.7;
			wind.scaleY = 0.7;
			wind.pivotX = wind.x /2;
			wind.pivotY = wind.y /2;
			windArray.push(wind);
			
			
			this.addChild(windDeux);
			windDeux.graphics.beginFill(0x8CC63F);
			windDeux.graphics.moveTo(centerScreenX, centerScreenY);
			windDeux.graphics.lineTo(638, 209);
			windDeux.graphics.lineTo(765, 300);
			windDeux.graphics.lineTo(centerScreenX, centerScreenY );
			windDeux.alpha = 0.2;
			windDeux.scaleX = 0.7;
			windDeux.scaleY = 0.7;
			windDeux.pivotX = wind.x /2;
			windDeux.pivotY = wind.y /2;
			windArray.push(windDeux);
			
			this.addChild(windTrois);
			windTrois.graphics.beginFill(0xFBB03B);
			windTrois.graphics.moveTo(centerScreenX, centerScreenY);
			windTrois.graphics.lineTo(765, 300);
			windTrois.graphics.lineTo(716, 450);
			windTrois.graphics.lineTo(centerScreenX, centerScreenY );
			windTrois.alpha = 0.2;
			windTrois.scaleX = 0.7;
			windTrois.scaleY = 0.7;
			windTrois.pivotX = wind.x /2;
			windTrois.pivotY = wind.y /2;
			windArray.push(windTrois);
			
			this.addChild(windQuatre);
			windQuatre.graphics.beginFill(0xF7931E);
			windQuatre.graphics.moveTo(centerScreenX, centerScreenY);
			windQuatre.graphics.lineTo(716, 450);
			windQuatre.graphics.lineTo(668, 597);
			windQuatre.graphics.lineTo(centerScreenX, centerScreenY );
			windQuatre.alpha = 0.2;
			windQuatre.scaleX = 0.7;
			windQuatre.scaleY = 0.7;
			windQuatre.pivotX = wind.x /2;
			windQuatre.pivotY = wind.y /2;
			windArray.push(windQuatre);
			
			this.addChild(windCinq);
			windCinq.graphics.beginFill(0xF15A24);
			windCinq.graphics.moveTo(centerScreenX, centerScreenY);
			windCinq.graphics.lineTo(668, 597);
			windCinq.graphics.lineTo(512, 597);
			windCinq.graphics.lineTo(centerScreenX, centerScreenY );
			windCinq.alpha = 0.2;
			windCinq.scaleX = 0.7;
			windCinq.scaleY = 0.7;
			windCinq.pivotX = wind.x /2;
			windCinq.pivotY = wind.y /2;
			windArray.push(windCinq);
			
			this.addChild(windSix);
			windSix.graphics.beginFill(0xC1272D);
			windSix.graphics.moveTo(centerScreenX, centerScreenY);
			windSix.graphics.lineTo(512, 597);
			windSix.graphics.lineTo(356, 597);
			windSix.graphics.lineTo(centerScreenX, centerScreenY );
			windSix.alpha = 0.2;
			windSix.scaleX = 0.7;
			windSix.scaleY = 0.7;
			windSix.pivotX = wind.x /2;
			windSix.pivotY = wind.y /2;
			windArray.push(windSix);
			
			this.addChild(windSept);
			windSept.graphics.beginFill(0x2E3192);
			windSept.graphics.moveTo(centerScreenX, centerScreenY);
			windSept.graphics.lineTo(356, 597);
			windSept.graphics.lineTo(308, 450);
			windSept.graphics.lineTo(centerScreenX, centerScreenY );
			windSept.alpha = 0.2;
			windSept.scaleX = 0.7;
			windSept.scaleY = 0.7;
			windSept.pivotX = wind.x /2;
			windSept.pivotY = wind.y /2;
			windArray.push(windSept);
			
			this.addChild(windHuit);
			windHuit.graphics.beginFill(0x0071BC);
			windHuit.graphics.moveTo(centerScreenX, centerScreenY);
			windHuit.graphics.lineTo(308, 450);
			windHuit.graphics.lineTo(259, 300);
			windHuit.graphics.lineTo(centerScreenX, centerScreenY );
			windHuit.alpha = 0.2;
			windHuit.scaleX = 0.7;
			windHuit.scaleY = 0.7;
			windHuit.pivotX = wind.x /2;
			windHuit.pivotY = wind.y /2;
			windArray.push(windHuit);
			
			this.addChild(windNeuf);
			windNeuf.graphics.beginFill(0x29ABE2);
			windNeuf.graphics.moveTo(centerScreenX, centerScreenY);
			windNeuf.graphics.lineTo(259, 300);
			windNeuf.graphics.lineTo(386, 209);
			windNeuf.graphics.lineTo(centerScreenX, centerScreenY );
			windNeuf.alpha = 0.2;
			windNeuf.scaleX = 0.7;
			windNeuf.scaleY = 0.7;
			windNeuf.pivotX = wind.x /2;
			windNeuf.pivotY = wind.y /2;
			this.addChild(windNeuf);
			windArray.push(windNeuf);
			
			this.addChild(windDix);
			windDix.graphics.beginFill(0x07b0a4);
			windDix.graphics.moveTo(centerScreenX, centerScreenY);
			windDix.graphics.lineTo(386, 209);
			windDix.graphics.lineTo(512, 118);
			windDix.graphics.lineTo(centerScreenX, centerScreenY );
			windDix.graphics.endFill();
			windDix.width = 125;
			windDix.height = 257;
			windDix.x = 470;
			windDix.y = 240;
			windDix.pivotX = 125/2;
			windDix.pivotY = 257/2;
			windDix.alpha = 0.2;
			windDix.scaleX = 0.7;
			windDix.scaleY = 0.7;
			windArray.push(windDix);
			trace('x,y: ',windDix.x, windDix.y);
			trace('w,h: ',windDix.width, windDix.height);
			
			
			var pointess:Shape = new Shape();
			this.addChild(pointess);
			pointess.graphics.beginFill(0xFF0000);
			pointess.graphics.drawRect(0,0,10,10);
			
			pointess.graphics.endFill();
			pointess.x = 470;
			pointess.y = 240;
			pointess.pivotX = pointess.width/2;
			pointess.pivotY = pointess.height/2;
			
			
			
			
			
			var timing:Number = 0.3;
			
			for (var i:int = 0; i < windArray.length; i++) 
			{
				TweenMax.to(windArray[i], timing, {alpha:1});
				TweenMax.to(windArray[i], timing, {scaleX: 1, scaleY: 1, ease:Bounce.easeOut});
				
				timing = timing + 0.3;
			}

			stage.addEventListener(TouchEvent.TOUCH, onPickerTouch);
		}
		
		private function onPickerTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage, TouchPhase.BEGAN);
			
			if (touch == null) return;
			TweenMax.to(windDix, 1,{x:200});
			
			var pos:Point = touch.getLocation(stage);
			trace(pos);
				 

			var timing:Number = 0.5;
		}
		
		private function angleInRaidans(degrees:Number):Number
		{
			return degrees * Math.PI / 180;
		}
		
	}
}