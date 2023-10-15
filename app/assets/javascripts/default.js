(function($)
{
	var parallax = function ()
	{
		$(window).on("scroll", function ()
		{
			var scroll = $(this).scrollTop() - 80;

			$(".main-container .section-1").css({ "background-position": "0px " + scroll / 2 + "px" });
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