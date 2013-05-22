package spira.events
{
	import starling.events.Event;
	
	public class TransitionManagerEvent extends Event
	{
		public static const TRANSITION_OUT:String 			= 'transitionOut';
		public static const TRANSITION_OUT_COMPLETE:String 	= 'transitionOutComplete';
		public static const TRANSITION_IN:String 				= 'transitionIn';
		public static const TRANSITION_IN_COMPLETE:String 	= 'transitionInCmplete';
		public static const ASSET_LOADED:String 			= 'assetLoaded';
		
		public function TransitionManagerEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
		}
	}
}