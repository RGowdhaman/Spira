package spira.screens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.mikesoylu.fortia.*;
	
	import flash.filesystem.File;
	
	import spira.assets.IntroAssets;
	import spira.entities.FirstLoader;
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	
	import utils.AtlasLoader;
	
	public class Intro extends Sprite
	{	
		private var loader:FirstLoader;
		
		private var atlas:TextureAtlas;
		private var atlasLoader:AtlasLoader;
		
		private var texture:Texture;
		private var spriteData:XML;
		
		public function Intro()
		{
			super();
	
			addEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
		}
		private function onAdded(event:Event):void
		{
			
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAdded);
			this.addEventListener(starling.events.Event.REMOVED_FROM_STAGE, onRemoved);
			
			
			/*	
			
			var assets:AssetManager = new AssetManager();
			assets.verbose = true;
			
			// enqueue "bird" texture and "explosion" sound
			assets.enqueue(spira.assets.IntroAssets);
			
			// enqueue a file from disk (AIR only)
			var appDir:File = File.applicationDirectory;
			assets.enqueue(appDir.resolvePath("media/loader.png"));
			
			// enqueue all contents of a directory, recursively (AIR only)
			assets.enqueue(appDir.resolvePath("textures"));
			
			// -> now load all the enqueued assets. When "ratio" equals "1", we are finished.
			assets.loadQueue(function(ratio:Number):void
			{
				trace("Loading assets, progress:", ratio);
				
				if (ratio == 1.0)
					startGame();
			});
			*/
			
			
			/*
			TODO: 
			Clear dirty code:
			resolve fAssetManager for xml error fix
			import osunds with fAssetmanager
			
			
			*/
			//fAssetManager.addManager("loader");
			trace('addManager');
			// enqueue the static contents of the Asset class and give it a name
			//fAssetManager.enqueue("loader", IntroAssets);
			trace('after enqueue');
			// start loading the assets
			//fAssetManager.loadQueues(initialize);
			
			initialize();
			
			//loader = new MovieClip(atlas
			//atlasLoader = new AtlasLoader(initialize);
		}
		
		private function initialize():void
		{
			
/*			texture = Texture.fromBitmap(fAssetManager.getTexture('loader_'));
			spriteData = atlasLoader.spriteData;
			
			atlas = new TextureAtlas(texture, atlasLoader.spriteData);*/
			
			trace('initialize: ');
			// init elements

			loader = new FirstLoader(fAssetManager.getTextures('loader'),15);
			loader.x = 1024/2;
			loader.y = 768/2;
			addChild(loader);
			// Tween In element
			
		}
		
		private function onRemoved():void
		{
			// Tween Out element
			super.dispose();
		}
	}
}