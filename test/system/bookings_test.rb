require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  setup do
    @booking = bookings(:one)
  end

  test "visiting the index" do
    visit bookings_url
    assert_selector "h1", text: "Bookings"
  end

  test "should create booking" do
    visit bookings_url
    click_on "New booking"

    fill_in "Addons", with: @booking.addons
    fill_in "Date", with: @booking.date
    fill_in "Email", with: @booking.email
    fill_in "Name", with: @booking.name
    fill_in "Package", with: @booking.package
    fill_in "Phone", with: @booking.phone
    fill_in "Venue", with: @booking.venue
    click_on "Create Booking"

    assert_text "Booking was successfully created"
    click_on "Back"
  end

  test "should update Booking" do
    visit booking_url(@booking)
    click_on "Edit this booking", match: :first

    fill_in "Addons", with: @booking.addons
    fill_in "Date", with: @booking.date
    fill_in "Email", with: @booking.email
    fill_in "Name", with: @booking.name
    fill_in "Package", with: @booking.package
    fill_in "Phone", with: @booking.phone
    fill_in "Venue", with: @booking.venue
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking" do
    visit booking_url(@booking)
    click_on "Destroy this booking", match: :first

    assert_text "Booking was successfully destroyed"
  end
end
