(function($) 
{
	var init = function ()
	{
		$(document).bind("contextmenu", function (e)
		{
			return false;
		});
	}
	
	init();
	
})(jQuery);