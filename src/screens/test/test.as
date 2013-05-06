// SpectrumAnalyzer.as
package {
	import flash.display.*;
	import flash.media.*;
	import flash.net.*;
	import flash.utils.ByteArray;
	import flash.events.*;
	class SpectrumAnalyzer extends Sprite {
		// Settings
		private var lineThickness:Number = 2;
		private var lineColor:Number = 0x993300;
		private var circleSize:Number = 75;
		private var scaleOnBeat:Number = 1.1; // 110%
		private var reactToBeat:Number = 30;
		//
		private var music:Sound = new Sound;
		private var ba:ByteArray = new ByteArray();
		private var __width:uint;
		private var __height:uint;
		function SpectrumAnalyzer(mp3:String, _width:uint, _height:uint) {
			__width = _width;
			__height = _height;
			x = __width/2;
			y = __height/2
			music.load(new URLRequest(mp3));
			music.play(0, 999);
			addEventListener(Event.ENTER_FRAME, processSound);
		}
		private function processSound(ev:Event):void {
			SoundMixer.computeSpectrum(ba, true, 0);
			graphics.clear();
			graphics.moveTo(0, -circleSize);
			graphics.lineStyle(lineThickness, lineColor);
			var vol:Number = 0;
			for (var i:uint = 0; i <512; i++) {
				var lev:Number = ba.readFloat();
				vol += lev;
				var a:uint = i;
				if (i <256) a += 256;
				if (i == 256) graphics.moveTo(0, -circleSize);
				graphics.lineTo(-Math.sin(i/256*Math.PI)*circleSize*(lev+1), Math.cos(a/256*Math.PI)*circleSize*(lev+1));
			}
			if (vol> reactToBeat) {
				scaleX = scaleY = scaleOnBeat;
			} else {
				scaleX = scaleY = 1;
			}
		}
	}
}