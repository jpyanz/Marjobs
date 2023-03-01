(function($) 
{
	var disableContextMenu = function ()
	{	
		$(document).bind("contextmenu", function (e)
		{
			return false;
		});
	};

	var init = function()
	{
		disableContextMenu();
	}
	
	init();
	
})(jQuery);