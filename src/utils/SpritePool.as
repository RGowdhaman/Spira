package utils
{
	import starling.display.DisplayObject;
	
	public class SpritePool
	{
		private var pool:Array;
		private var counter:int;
		
		public function SpritePool(type:Class, len:int)
		{
			pool = new Array();
			counter = len;
			
			var i:int = len;
			// on créer le tableau avec len la tialle du tableau
			while(--i > -1)
				pool[i] = new type();
		}
		
		public function getSprite():DisplayObject
		{
			if(counter > 0)
				// on lui retourne son sprite
				return pool[--counter];
			else
				throw new Error("you exhausted the pool!");
		}
		
		public function returnSprite(s:DisplayObject):void
		{
			pool[counter++] = s;			
		}
	}
}