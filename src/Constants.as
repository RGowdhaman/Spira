package
{
	import starling.errors.AbstractClassError;
	
	public class Constants
	{
		public function Constants() { throw new AbstractClassError(); }
		
		public static const STAGE_WIDTH:int  = 1024;
		public static const STAGE_HEIGHT:int = 768;
		public static const VIEW_PORT:int = 1;
	}
}