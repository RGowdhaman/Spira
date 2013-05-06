package screens.test
{
	import flash.display.*;
	import flash.events.*;
	import flash.media.*;
	import flash.media.Sound;
	import flash.net.*;
	import flash.utils.ByteArray;
	
	import starling.display.Image;
	
	public class SpectrumAnalyzer extends Sprite
	{        
		
		// Settings
		
		private var lineThickness : Number = 2;
		private var lineColor : Number = 0x993300;
		private var circleSize : Number = 75;
		private var scaleOnBeat:Number = 1.1; // 110%
		private var reactToBeat:Number = 30;
		
		private var music : Sound;
		private var mainChannel:SoundChannel;
		private var ba : ByteArray;
		private var __width : uint;
		private var __height : uint;
		private var shape:Shape;
		private var shapeDeux:Shape;
		[Embed(source='../media/sounds/samples/percuTribal.mp3')]
		private const percuTribal:Class;
		
		
		public function SpectrumAnalyzer(mp3 : String, _width : uint, _height : uint) {
			super();
		
			music = new percuTribal();
			mainChannel = music.play();
			
			
			shape = new Shape();
			addChild(shape);
			shape.x = 30;
			shape.y = 30;
			
			shape.graphics.beginFill(0x8dc63f);
			shape.graphics.drawRect(0, 0, 100, 100);
			shape.graphics.endFill();
			
			shapeDeux = new Shape();
			addChild(shapeDeux);
			shapeDeux.x = 30;
			shapeDeux.y = 30;
			
			shapeDeux.graphics.beginFill(0xFF0033);
			shapeDeux.graphics.drawRect(500,0,100,100);
			shapeDeux.graphics.endFill();
			
			ba = new ByteArray();
			__width = _width;
			__height = _height;
			x = __width / 2;
			y = __height / 2
			addEventListener( Event.ENTER_FRAME, processSound );
		}
		
		private function processSound(ev : Event) : void {
			SoundMixer.computeSpectrum( ba, true, 0 );
			graphics.clear( );
			graphics.moveTo( 0, -circleSize );
			graphics.lineStyle( lineThickness, lineColor );
			var vol : Number = 0;
			for (var i : uint = 0; i <512 ; i++) {
				var lev : Number = ba.readFloat( );
				vol += lev;
				var a : uint = i;
				if(vol > 5)
					shape.width = shape.height = vol;
				else 
					shape.width = shape.height = 30;
				
				trace('lev: ',lev, 'vol: ', vol);
				// Rect drawn with drawRect()
				//graphics.lineTo( -Math.sin( i / 256 * Math.PI ) * circleSize * (lev + 1), Math.cos( a / 256 * Math.PI ) * circleSize * (lev + 1) );
			}
		}
	}
}