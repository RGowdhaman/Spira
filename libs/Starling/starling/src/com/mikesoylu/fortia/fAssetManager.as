package com.mikesoylu.fortia
{
	
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	/**
	 * Contains all sounds and medias 
	 * @author bertrand
	 * 
	 */	
	public class fAssetManager
	{
		
		// unique instance of AssetManager
		private static var _instance:AssetManager = null;
		// var usefull for AssetsManager
		public static var scaleFactor:Number = 1;
		public static var useMipmaps:Boolean = false;
		
		// _instance getter :: automatically instanced when we call an function of the ChallengeAssets
		public static function get instance():AssetManager
		{
			if( null == _instance )
			{
				_instance = new AssetManager(scaleFactor, useMipmaps);
				// trace information about added/enqueued assets.
				_instance.verbose = true;
			}
			
			return _instance;
		}
		
		// destroy instance
		public static function destroy():void
		{
			if( null != _instance)
			{
				// Removes assets of all types and empties the queue.
				_instance.purge();
				_instance = null;
			}
		}
		
		// LOADING QUEUE
		public static function loadQueue(onComplete:Function):void
		{
			instance.loadQueue( function(ratio:Number):void
			{
				// if loadQueue is completed
				if( ratio == 1.0 )
				{
					onComplete();
				}
			});
		}
		
		// ENQUEUE :: WAITING FOR PROCESSING
		public static function enqueue(... rawAssets):void
		{
			instance.enqueue(rawAssets);
		}
		
		/* -- TEXTURE AND TEXTURE ATLAS */
		
		// GET TEXTURE FROM AN ASSET
		public static function getTexture(name:String):Texture
		{
			return instance.getTexture(name);
		}
		
		// GET TEXTURES FROM TEXTURES ASSET
		public static function getTextures(prefix:String = "", result:Vector.<Texture> = null):Vector.<Texture>
		{
			return instance.getTextures(prefix, result);
		}
		
		public static function removeTexture(name:String):void
		{
			instance.removeTexture(name, true);
		}
		
		public static function removeTextureAtlas(name:String):void
		{
			instance.removeTextureAtlas(name);
		}
		
		/* -- SOUNDS */
		
		// PLAY SOUND
		public static function play(name:String, loops:int = 0, volume:Number = 1, pan:Number = 0):SoundChannel
		{
			return instance.playSound(name, 0, loops, new SoundTransform(volume, pan));	
		}
		
		// REMOVE SOUND
		public static function removeSound(name:String):void{
			instance.removeSound(name);
		}
	}
}