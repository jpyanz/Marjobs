(function($)
{
	var parallax = function ()
	{
		$(window).on("scroll", function ()
		{
			var scroll = $(this).scrollTop() - ($(window).outerHeight() - 250);

			$(".main-container").css({ "background-position": "0px " + scroll / 2 + "px" });
		});
	};

	var init = function ()
	{
		$(document).bind("contextmenu", function (e)
		{
			return false;
		});

		$(document).ready(function ()
		{
			//$(this).scrollTop(0);
		});

		parallax();
	}

	init();

})(jQuery);