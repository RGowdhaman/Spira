package
{
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	
	public class Assets
	{
		
		[Embed(source="../media/models/final.png")]
		public static const final:Class;
		
		[Embed(source="../media/models/cursor.png")]
		public static const cursor:Class;
		
		[Embed(source="../media/models/samplePicker.png")]
		public static const samplePicker:Class;
		
		
		[Embed(source="../media/models/text_rythme.png")]
		public static const textRythme:Class;
		[Embed(source="../media/models/text_percu.png")]
		public static const textPercu:Class;
		[Embed(source="../media/models/text_melo.png")]
		public static const textMelo:Class;
		
		[Embed(source="../media/models/loader.png")]
		public static const loader:Class;
		
		[Embed(source="../media/models/puceOff.png")]
		public static const puceOff:Class;
	
		

		// splash screen
		[Embed(source="../media/backgrounds/splashScreen.png")]
		public static const splashScreen:Class;
		
		[Embed(source="../media/backgrounds/bigTitle.png")]
		public static const bigTitle:Class;
		
		[Embed(source="../media/buttons/bt_badgeWizard.png")]
		public static const btBadge:Class;
		
		[Embed(source="../media/buttons/bt_animation.png")]
		public static const btAnimation:Class;
		
		[Embed(source="../media/buttons/text_badgeWizard.png")]
		public static const textBadge:Class;
		
		[Embed(source="../media/buttons/text_animation.png")]
		public static const textAnimation:Class;		
		
		// old assets
		[Embed(source="../media/graphics/bgWelcome.jpg")]
		public static const BgWelcome:Class;
		
		[Embed(source="../media/backgrounds/interface.png")]
		public static const bgInterface:Class;
		
		[Embed(source="../media/graphics/welcome_hero.png")]
		public static const WelcomeHero:Class;
		
		[Embed(source="../media/graphics/welcome_title.png")]
		public static const WelcomeTitle:Class;
		
		[Embed(source="../media/buttons/create.png")]
		public static const WelcomePlayBtn:Class;
		
		[Embed(source="../media/buttons/viewMandala.png")]
		public static const WelcomeAboutBtn:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
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
		
		
		
	}
}