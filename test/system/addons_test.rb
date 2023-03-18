require "application_system_test_case"

class AddonsTest < ApplicationSystemTestCase
  setup do
    @addon = addons(:one)
  end

  test "visiting the index" do
    visit addons_url
    assert_selector "h1", text: "Addons"
  end

  test "should create addon" do
    visit addons_url
    click_on "New addon"

    fill_in "Name", with: @addon.name
    fill_in "Price", with: @addon.price
    click_on "Create Addon"

    assert_text "Addon was successfully created"
    click_on "Back"
  end

  test "should update Addon" do
    visit addon_url(@addon)
    click_on "Edit this addon", match: :first

    fill_in "Name", with: @addon.name
    fill_in "Price", with: @addon.price
    click_on "Update Addon"

    assert_text "Addon was successfully updated"
    click_on "Back"
  end

  test "should destroy Addon" do
    visit addon_url(@addon)
    click_on "Destroy this addon", match: :first

    assert_text "Addon was successfully destroyed"
  end
end
