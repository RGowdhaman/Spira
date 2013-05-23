package spira.models
{
	import flash.geom.Point;
	
	import spira.events.NavigationEvent;
	
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Pentagone extends Sprite
	{
		private var triangleShape:Shape;
		
		private var A1:Point;
		private var B1:Point;
		private var C1:Point;
		
		private var A2:Point;
		private var B2:Point;
		private var C2:Point;
		
		private var A3:Point;
		private var B3:Point;
		private var C3:Point;
		
		private var A4:Point;
		private var B4:Point;
		private var C4:Point;
		
		private var A5:Point;
		private var B5:Point;
		private var C5:Point;
		
		/**
		 * TODO: 
		 * merge point into vertexData
		 * clean touch event
		 * 
		 * 
		 * 
		 * 
		 * 
		 **/
		private var triangle:Vector.<Point>;
		public function Pentagone()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded():void
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			drawScreen();
		}
		
		private function onRemoved():void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
		}
		private function drawScreen():void
		{
			// face one
			A1=new Point(517, 377);
			B1=new Point(517, 218);
			C1=new Point(664, 329);
			
			// face two
			A2=new Point(519, 386);
			B2=new Point(667, 336);
			C2=new Point(611, 512);
			
			// face three
			A3=new Point(512, 392);
			B3=new Point(605, 518);
			C3=new Point(418, 518);
			
			// face four
			A4=new Point(504, 386);
			B4=new Point(411, 512);
			C4=new Point(353, 336);
			
			// face five
			A5=new Point(507, 377);
			B5=new Point(356, 329);
			C5=new Point(507, 218);
			
			
			triangle = new Vector.<Point>();
			triangle.push(A1, B1, C1);
			triangle.push(A2, B2, C2);
			triangle.push(A3, B3, C3);
			triangle.push(A4, B4, C4);
			triangle.push(A5, B5, C5);
			
			
			triangleShape = new Shape();
			triangleShape.graphics.beginFill(0xEEEEEE, .001);
			
			
			for (var i:int = 0; i < triangle.length; i++) 
			{
				// tout les 3 points
				if(triangle.length-i % 3 == 15)
				{
					if(i != 0){
						triangleShape.graphics.endFill();
						triangleShape.graphics.beginFill(0xEEEEEE, .001);
					}
					triangleShape.graphics.moveTo(triangle[i].x, triangle[i].y); 
				}
				else{
					triangleShape.graphics.lineTo(triangle[i].x, triangle[i].y); 
				}
			}
			addChild(triangleShape);
			
			this.addEventListener(TouchEvent.TOUCH, onTouched);
		}
		
		private function onTouched(event:TouchEvent):void
		{
			var touchBegan:Touch = event.getTouch(this, TouchPhase.ENDED);
			if (touchBegan)
			{
				var localPosBegan:Point = touchBegan.getLocation(this);
				
				if (isInsideTriangle(triangle[0] ,triangle[1] ,triangle[2], localPosBegan)) {
					triangleShape.graphics.lineStyle(1,0xFF0000);
					dispatchEvent(new NavigationEvent(NavigationEvent.PENTAGONE_DATA, false, {face: 'A'}));
				}
				if (isInsideTriangle(triangle[3] ,triangle[4] ,triangle[5], localPosBegan)) {
					triangleShape.graphics.lineStyle(1,0xFF0000);
					dispatchEvent(new NavigationEvent(NavigationEvent.PENTAGONE_DATA, false, {face: 'B'}));
				}
				if (isInsideTriangle(triangle[6] ,triangle[7] ,triangle[8], localPosBegan)) {
					triangleShape.graphics.lineStyle(1,0xFF0000);
					dispatchEvent(new NavigationEvent(NavigationEvent.PENTAGONE_DATA, false, {face: 'C'}));
				}
				if (isInsideTriangle(triangle[9] ,triangle[10] ,triangle[11], localPosBegan)) {
					triangleShape.graphics.lineStyle(1,0xFF0000);
					dispatchEvent(new NavigationEvent(NavigationEvent.PENTAGONE_DATA, false, {face: 'D'}));
				}
				if (isInsideTriangle(triangle[12] ,triangle[13] ,triangle[14], localPosBegan)) {
					triangleShape.graphics.lineStyle(1,0xFF0000);
					dispatchEvent(new NavigationEvent(NavigationEvent.PENTAGONE_DATA, false, {face: 'E'}));
				}
			}
		}

		private function isInsideTriangle(A:Point,B:Point,C:Point,P:Point):Boolean 
		{
			var planeAB:Number = (A.x-P.x)*(B.y-P.y)-(B.x-P.x)*(A.y-P.y);
			var planeBC:Number = (B.x-P.x)*(C.y-P.y)-(C.x - P.x)*(B.y-P.y);
			var planeCA:Number = (C.x-P.x)*(A.y-P.y)-(A.x - P.x)*(C.y-P.y);
			return sign(planeAB)==sign(planeBC) && sign(planeBC)==sign(planeCA);
		}
		
		private function sign(n:Number):int {
			return Math.abs(n)/n;
		}
	}
}