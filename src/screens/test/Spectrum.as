package screens.test
{
	import flash.display.*;
	import screens.test.SpectrumAnalyzer;
	public class Spectrum extends Sprite
	{
		public function Spectrum()
		{
			super();
			var visualization:SpectrumAnalyzer = new SpectrumAnalyzer("../media/sounds/samples/pianoFunky.mp3", 550, 400);
			addChild(visualization);
		}
	}
}