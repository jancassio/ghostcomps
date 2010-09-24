// Index methods
var Index = 
{
	/**
	* Initialize scripts after page load 
	*/  
	init : function ()
	{
		Demo.show();
	}
}

// SWF Demo general methods
var Demo =
{
	/**
	* Embed the swf.
	*/  
	show : function ()
	{
		playerVersion = "10";
		flashvars     = {};
		params        = {};
		attr          = {};
		
		swfobject.embedSWF(
			"flash/complete_demo.swf",
			"complete_demo",
			"100%", "750",
			playerVersion,
			"flash/expressInstall.swf",
			flashvars,
			params,
			attr
		);
	}
}