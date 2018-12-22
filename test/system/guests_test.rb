require "application_system_test_case"

class GuestsTest < ApplicationSystemTestCase
  setup do
    @guest = guests(:one)
  end

  test "visiting the index" do
    visit guests_url
    assert_selector "h1", text: "Guests"
  end

  test "creating a Guest" do
    visit guests_url
    click_on "New Guest"

    fill_in "Address", with: @guest.address
    fill_in "Birth", with: @guest.birth
    fill_in "Identitycard", with: @guest.identitycard
    fill_in "Image", with: @guest.image
    fill_in "Job", with: @guest.job
    fill_in "Name", with: @guest.name
    fill_in "Notice", with: @guest.notice
    fill_in "Phonenumber", with: @guest.phonenumber
    click_on "Create Guest"

    assert_text "Guest was successfully created"
    click_on "Back"
  end

  test "updating a Guest" do
    visit guests_url
    click_on "Edit", match: :first

    fill_in "Address", with: @guest.address
    fill_in "Birth", with: @guest.birth
    fill_in "Identitycard", with: @guest.identitycard
    fill_in "Image", with: @guest.image
    fill_in "Job", with: @guest.job
    fill_in "Name", with: @guest.name
    fill_in "Notice", with: @guest.notice
    fill_in "Phonenumber", with: @guest.phonenumber
    click_on "Update Guest"

    assert_text "Guest was successfully updated"
    click_on "Back"
  end

  test "destroying a Guest" do
    visit guests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Guest was successfully destroyed"
  end
end
