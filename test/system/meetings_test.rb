require "application_system_test_case"

class MeetingsTest < ApplicationSystemTestCase
  setup do
    @meeting = meetings(:one)
  end

  test "visiting the index" do
    visit meetings_url
    assert_selector "h1", text: "Meetings"
  end

  test "should create meeting" do
    visit meetings_url
    click_on "New meeting"

    fill_in "Category", with: @meeting.category
    fill_in "Contact", with: @meeting.contact
    fill_in "Date", with: @meeting.date
    fill_in "Email", with: @meeting.email
    fill_in "Name", with: @meeting.name
    fill_in "Other", with: @meeting.other
    fill_in "Preffered date", with: @meeting.preffered_date
    click_on "Create Meeting"

    assert_text "Meeting was successfully created"
    click_on "Back"
  end

  test "should update Meeting" do
    visit meeting_url(@meeting)
    click_on "Edit this meeting", match: :first

    fill_in "Category", with: @meeting.category
    fill_in "Contact", with: @meeting.contact
    fill_in "Date", with: @meeting.date
    fill_in "Email", with: @meeting.email
    fill_in "Name", with: @meeting.name
    fill_in "Other", with: @meeting.other
    fill_in "Preffered date", with: @meeting.preffered_date
    click_on "Update Meeting"

    assert_text "Meeting was successfully updated"
    click_on "Back"
  end

  test "should destroy Meeting" do
    visit meeting_url(@meeting)
    click_on "Destroy this meeting", match: :first

    assert_text "Meeting was successfully destroyed"
  end
end
