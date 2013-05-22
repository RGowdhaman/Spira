package utils
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class AtlasLoader
	{

		public function get spriteData():XML
		{
			return _spriteData;
		}

		public function set spriteData(value:XML):void
		{
			_spriteData = value;
		}

		public function get spriteImage():Bitmap
		{
			return _spriteImage;
		}

		public function set spriteImage(value:Bitmap):void
		{
			_spriteImage = value;
		}

		private var callback:Function;
		private var ld:Loader;
		private var ul:URLLoader;
		
		private var _spriteImage:Bitmap;
		private var _spriteData:XML;
		
		public function AtlasLoader(callback:Function)
		{
			this.callback = callback;
			ld = new Loader();
			
			ld.load(new URLRequest("media/loader.png"));
			ld.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			ld.contentLoaderInfo.addEventListener(Event.COMPLETE, ld_complete);
			
			ul = new URLLoader(new URLRequest('media/loader.xml'));			
			ld.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			ul.addEventListener(Event.COMPLETE, ul_complete);
			
		}
		
		private function notifyLoad():void
		{
			if(spriteData && spriteImage){
				callback();
				callback = null;
			}
		}
		
		private function ul_complete(e:Event):void
		{
			spriteData = XML(ul.data);
		}
		
		
		private function ld_complete(e:Event):void
		{
			spriteImage = ld.content as Bitmap;
			notifyLoad();
		}
		
		private function ioError(e:IOErrorEvent):void
		{
			trace(e.text);
			
		}
	}
}