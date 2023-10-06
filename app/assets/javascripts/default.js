(function($)
{
	var parallax = function ()
	{
		$(window).on("scroll", function ()
		{
			var scroll = $(this).scrollTop() - 80;

			$(".main-container").css({ "background-position": "center " + scroll / 2 + "px" });
		});
	};

	var init = function ()
	{
		$(document).bind("contextmenu", function (e)
		{
			return false;
		});

		parallax();
	}

	init();

})(jQuery);