package spira.entities
{	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	
	public class FirstLoader extends MovieClip
	{
		public function FirstLoader(textures:Vector.<Texture>, fps:Number=12)
		{
			super(textures, fps);
			this.pivotX = this.width / 2;
			this.pivotY = this.height / 2;
			this.loop = false;
			
			addEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded():void
		{
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
			addEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoved);
		}
		
		private function onRemoved():void
		{
			removeEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoved);
		}
	}
}