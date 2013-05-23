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
		private var _instance:AssetManager = null;
		// var usefull for AssetsManager
		public var scaleFactor:Number = 1;
		public var useMipmaps:Boolean = false;
		
		public function fAssetManager():void{
		}
		// _instance getter :: automatically instanced when we call an function of the ChallengeAssets
		public function get instance():AssetManager
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
		public function destroy():void
		{
			if( null != _instance)
			{
				// Removes assets of all types and empties the queue.
				_instance.purge();
				_instance = null;
			}
		}
		
		// LOADING QUEUE
		public function loadQueue(onComplete:Function):void
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
		public function enqueue(... rawAssets):void
		{
			instance.enqueue(rawAssets);
		}
		
		/* -- TEXTURE AND TEXTURE ATLAS */
		
		// GET TEXTURE FROM AN ASSET
		public function getTexture(name:String):Texture
		{
			return instance.getTexture(name);
		}
		
		// GET TEXTURES FROM TEXTURES ASSET
		public function getTextures(prefix:String = "", result:Vector.<Texture> = null):Vector.<Texture>
		{
			return instance.getTextures(prefix, result);
		}
		
		public function removeTexture(name:String):void
		{
			instance.removeTexture(name, true);
		}
		
		public function removeTextureAtlas(name:String):void
		{
			instance.removeTextureAtlas(name);
		}
		
		/* -- SOUNDS */
		
		// PLAY SOUND
		public function play(name:String, loops:int = 0, volume:Number = 1, pan:Number = 0):SoundChannel
		{
			return instance.playSound(name, 0, loops, new SoundTransform(volume, pan));	
		}
		
		// REMOVE SOUND
		public function removeSound(name:String):void{
			instance.removeSound(name);
		}
	}
}