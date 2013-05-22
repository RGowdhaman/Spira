package spira.models
{
	public class NavOptions
	{
		public var screenId:String;
		public var data:*;
		
		public function NavOptions(page:String, data:* = null)
		{
			this.screenId = page;
			this.data = data;
		}
	}
}