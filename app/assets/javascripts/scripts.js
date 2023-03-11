(function($) 
{
	var init = function ()
	{
		const dropdownElementList = document.querySelectorAll('.dropdown-toggle')
		const dropdownList = [...dropdownElementList].map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl))
	}
	
	init();
	
})(jQuery);