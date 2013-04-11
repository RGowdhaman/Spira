package screens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class CreateSpi extends Sprite
	{
		private var scaleFactor:int;
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
			
			this.addChild(triangle)
			
			var wind:Shape = new Shape();
			var windDeux:Shape = new Shape();
			var windTrois:Shape = new Shape();
			var windQuatre:Shape = new Shape();
			var windSix:Shape = new Shape();
			var windSept:Shape = new Shape();
			var windHuit:Shape = new Shape();
			var windNeuf:Shape = new Shape();
			var windDix:Shape = new Shape();
			
			var windHeight:uint = 380;
			var centerScreenX:uint = 512;
			var centerScreenY:uint = 384;
			
			
			wind.graphics.beginFill(0x27a275);
			wind.graphics.moveTo(centerScreenX, centerScreenY);
			wind.graphics.lineTo(centerScreenX, centerScreenY - 180);
			wind.graphics.lineTo(centerScreenX + 85, centerScreenY - 118);
			wind.graphics.lineTo(centerScreenX, centerScreenY );
			this.addChild(wind);
			
			
			/*wind.graphics.beginFill(0x27a275);
			wind.graphics.moveTo(384, 512);
			wind.graphics.lineTo(384, 512 + windHeight);
			wind.graphics.lineTo(884 + 133, 512 + windHeight + 180);
			wind.graphics.lineTo(884 + 384, 512 + windHeight);*/
			
			windDeux.graphics.beginFill(0x07b0a4);
			windDeux.graphics.moveTo(centerScreenX, centerScreenY);
			windDeux.graphics.lineTo(centerScreenX, centerScreenY - 180);
			windDeux.graphics.lineTo(centerScreenX - 85, centerScreenY - 118);
			windDeux.graphics.lineTo(centerScreenX, centerScreenY );
			this.addChild(windDeux);
			
			windTrois.graphics.beginFill(0x87c13a);
			windTrois.graphics.moveTo(centerScreenX, centerScreenY);
			windTrois.graphics.lineTo(centerScreenX + 85, centerScreenY - 118);
			windTrois.graphics.lineTo(centerScreenX + 170, centerScreenY - 60);
			windTrois.graphics.lineTo(centerScreenX, centerScreenY );
			this.addChild(windTrois);
			
		}
		
	}
}