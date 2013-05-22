package spira.events
{
	import starling.events.Event;
	import starling.events.EventDispatcher;
	
	public class TransitionManager
	{
		
		private var transitionEvent:TransitionManagerEvent;
		protected static var disp:EventDispatcher = new EventDispatcher();
		
		// NO NEED CONSTRUCTOR
		public function TransitionManager(){ }
		
		
		// STATIC DISPATCH EVENT
		public static function dispatchEvent(customEvent:Event):void{
			if( disp == null ) {
				return;
			}
			disp.dispatchEvent(customEvent);
			//trace('dispatched', disp, customEvent);
		}
		
		// STATIC ADDEVENTLISTENER
		public static function addEventListener(customEvent:String, func:Function, useCaption:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			if( disp == null ) {
				disp = new EventDispatcher();
			}
			
			disp.addEventListener(customEvent, func);
		}
		
		// STATIC REMOVELISTENER
		public static function removeEventListener(customEvent:String, func:Function, useCaption:Boolean = false):void{
			if( disp == null ) return;
			disp.removeEventListener(customEvent, func);
		}
		
		
		public static function hasEventListener(customEvent:String):void{
			if( disp == null){
				return;
			}
			
			if ( disp.hasEventListener(customEvent) ) trace('event exists');
			else trace('event not exists');
		}
		
		// Public API that dispatches an event
		public static function loadSomeData():void{
			dispatchEvent( new Event(Event.COMPLETE) );
		}
	}
}