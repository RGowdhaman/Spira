package spira
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Loader extends MovieClip
	{
		private var loader:MovieClip;
		public function Loader(atlas:TextureAtlas>, fps:Number=12)
		{
			loader = new MovieClip(atlas.getTextures('loader_'), 15);
			loader.x = loader.width/2;
			loader.y = loader.height/2;
			
			
			addEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded():void
		{
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
			addEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoved);
			
			Starling.juggler.add(loader);
		}
		
		private function onRemoved():void
		{
			Starling.juggler.remove(loader);
		}
	}
}