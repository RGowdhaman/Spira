package spira.events
{
	import starling.events.Event;
	
	public class NavigationEvent extends Event
	{
		public static var CHANGE_SCREEN:String = 'changeScreen';
		public static var PENTAGONE_DATA:String = 'pentagoneData';
		
		//public var screen:String;
		
		public function NavigationEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
		}
	}
}