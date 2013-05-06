package screens.test
{
	
	import flash.geom.Point;
	
	import models.Pentagone;
	
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.SpritePool;
	import starling.display.Image;
	
	
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.display.graphics.Fill;
	import starling.display.graphics.Stroke;
	import starling.display.materials.StandardMaterial;
	import starling.display.shaders.fragment.TextureVertexColorFragmentShader;
	import starling.display.shaders.vertex.StandardVertexShader;
	import flash.geom.Matrix;

	public class testScreen extends Sprite
	{
		
		private var pentagoneTest:Pentagone;
		
		private var pentaList:Array;
		
		
		private var firstPosition:Point;
		private var lastPosition:Point;
		
		private var slideSelected:int = 0;
		private var fontMusique:Image;
		
		public function testScreen()
		{
			super();
			
			fontMusique = new Image(Assets.getTexture("fondMusique"));
			fontMusique.width = 1024;
			fontMusique.height = 768;
			fontMusique.alpha = 0.7;
			addChild(fontMusique);
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, added);
		}
		
		private function added():void
		{
			var top:int = 0;
			var left:int = 0;
			var right:int = 100;
			var bottom:int = 100;
			
			var fillColor:uint = 0x08acff;
			var fillAlpha:Number = 1;
			var strokeColor:int = 0xc07732;
			var strokeAlpha:Number = 1;
			var strokeThickness:int = 3;
			
			// Rect drawn with drawRect()
			var shape:Shape = new Shape();
			addChild(shape);
			
			shape.x = 100;
			shape.y = 100;
			
			shape.graphics.beginFill(fillColor, fillAlpha);
			shape.graphics.lineStyle(strokeThickness, strokeColor, strokeAlpha);
			shape.graphics.drawRect(top, left, right, bottom);
			shape.graphics.endFill();
			
			// Rect drawn with lineTo()
			shape = new Shape();
			addChild(shape);
			
			shape.x = 300;
			shape.y = 100;
			
			shape.graphics.beginFill(fillColor, 0.2);
			shape.graphics.lineStyle(5, 0xFF0000, strokeAlpha);
			shape.graphics.moveTo(left, top);
			shape.graphics.lineTo(right, top);
			shape.graphics.lineTo(right, bottom);
			shape.graphics.lineTo(left, bottom);
			shape.graphics.lineTo(left, top);
			
			shape.graphics.endFill();
			
			// Filled Circle
			shape = new Shape();
			addChild(shape);
			
			shape.x = 150;
			shape.y = 300;
			
			shape.graphics.beginFill(fillColor, 0.2);
			shape.graphics.lineStyle(5, 0x00FF00, strokeAlpha);
			shape.graphics.drawCircle(0, 0, 50);
			shape.graphics.endFill();
			
			// Line Ellipse
			shape = new Shape();
			addChild(shape);
			
			shape.x = 350;
			shape.y = 300;
			
			shape.graphics.lineStyle(3, 0x0000FF, strokeAlpha);
			shape.graphics.drawEllipse(0, 0, 75, 50);
			
			// Triangle
			shape = new Shape();
			addChild(shape);
			
			shape.x = 500;
			shape.y = 100;
			
			shape.graphics.beginFill(fillColor, 0.2);
			shape.graphics.lineStyle(2, 0xFF0000, 0.5);
			shape.graphics.moveTo(left, top);
			shape.graphics.lineTo(right, bottom);
			shape.graphics.lineTo(left, bottom);
			shape.graphics.lineTo(left, top);
			
			shape.graphics.endFill();
			
			// Triangle with CheckerBMP
			shape = new Shape();
			addChild(shape);
			
			var m:Matrix = new Matrix();
			m.translate(0, 0);
			
			shape.x = 100;
			shape.y = 400;
			
			shape.graphics.beginBitmapFill(new CheckerBMP(), m);
			shape.graphics.lineStyle(2, 0xFF0000, 0.5);
			shape.graphics.moveTo(left, top);
			shape.graphics.lineTo(right, bottom);
			shape.graphics.lineTo(left, bottom);
			shape.graphics.lineTo(left, top);
			shape.graphics.endFill();
			
			// Marble
			shape = new Shape();
			addChild(shape);
			
			shape.x = 350;
			shape.y = 450;
			
			m = new Matrix();
			m.translate(-25, -25);
			shape.graphics.beginBitmapFill(new MarbleBMP(), m, false);
			shape.graphics.lineStyle(2, 0xFF0000, strokeAlpha);
			shape.graphics.drawCircle(0, 0, 25);
			shape.graphics.endFill();
			
			// Rect drawn with textured fill and stroke
			shape = new Shape();
			addChild(shape);
			
			m = new Matrix();
			m.translate(0, 0);
			
			shape.x = 500;
			shape.y = 400;
			
			var rockTexture:Texture = Texture.fromBitmap( new RockBMP(), false );
			var grassTexture:Texture = Texture.fromBitmap( new GrassBMP(), false );
			
			shape.graphics.beginTextureFill(rockTexture, m);
			shape.graphics.lineTexture(20, grassTexture);
			shape.graphics.drawRect(top, left, right, bottom);
			shape.graphics.endFill();
			
		}
			
			
			
			pentaList = new Array();
			var defaultY:int = 384 - 95;
			for (var i:int = 0; i < 3; i++) 
			{
				if(i == 0) 
				{
					pentagoneTest = new Pentagone(1);
					pentagoneTest.addListeners();
				}
				else
				{
					pentagoneTest = new Pentagone();
				}
				
				pentagoneTest.pentagone.y = defaultY;
				pentagoneTest.cursor.y = defaultY;
				pentaList.push(pentagoneTest);
				addChild(pentagoneTest);
				defaultY = defaultY + 600;
			}	
			trace(pentaList.length);
			fontMusique.addEventListener(TouchEvent.TOUCH, onClick);
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
	}
}