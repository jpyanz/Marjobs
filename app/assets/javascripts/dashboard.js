(function($)
{
	var init = function ()
	{
		MeetingOtherSelect();
	}

	var MeetingOtherSelect = function ()
	{
		let EditMeetingContainer = '.edit-meeting-container',
			otherInput = $('input#meeting_other', EditMeetingContainer),
			categorySelect = $('select#meeting_category', EditMeetingContainer);

		categorySelect.on('change', function ()
		{
			otherInput.prop('disabled', $(this).val() == "Others" ? false : true).val("");
		});

		categorySelect.val() == "Others" ? otherInput.prop('disabled', false) : otherInput.val("");
	};

	init();

})(jQuery);