package spira.entities
{	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	
	public class FirstLoader extends Sprite
	{

		private var loader:MovieClip;
		
		public function FirstLoader(textures:Vector.<Texture>, fps:Number=12)
		{
			loader = new MovieClip(textures, 30);
			loader.pivotX = loader.width / 2;
			loader.pivotY = loader.height / 2;
			addChild(loader);
			
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