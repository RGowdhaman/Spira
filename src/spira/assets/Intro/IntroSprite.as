package spira.assets.Intro
{
	import com.mikesoylu.fortia.fAssetManager;

	public class IntroSprite extends fAssetManager
	{
		
		[Embed(source="../media/graphics/loader.png")]
		public static var loader:Class;
		
		[Embed(source="../media/graphics/loader.xml", mimeType="application/octet-stream")]
		public static var atlasLoader:Class;
	}
}