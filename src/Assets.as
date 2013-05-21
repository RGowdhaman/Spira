package
{
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets
	{
		
		// splash screen
		[Embed(source="../media/backgrounds/splashScreen_x2.png")]
		public static const splashScreen:Class;
		[Embed(source="../media/backgrounds/fondMusique_x2.png")]
		public static const fondMusique:Class;
		
		
		
		
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		
		
		[Embed(source="../media/graphics/triangle.png")]
		public static const AtlasTextureTriangle:Class;
		
		[Embed(source="../media/graphics/triangle.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlTriangle:Class;
		
		
		
		
		[Embed(source="../media/graphics/spiraSheet_sd.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source="../media/graphics/spiraSheet_sd.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		// FONTS
		//[Embed(source="../media/fonts/Fetish-No338.otf", fontFamily="Fetish", embedAsCFF="false")]
		//public static var MyFetish:Class;		
		
		public static function getTexture(name:String):Texture
		{
			if(gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];	
		}
		
		public static function getAtlas():TextureAtlas
		{
			if(gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas = new TextureAtlas(texture,xml);
			}
			return gameTextureAtlas;
			
		}
		
		public static function getAtlasTriangle():TextureAtlas
		{
			if(gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureTriangle");
				var xml:XML = XML(new AtlasXmlTriangle());
				gameTextureAtlas = new TextureAtlas(texture,xml);
			}
			return gameTextureAtlas;
			
		}
	}
}