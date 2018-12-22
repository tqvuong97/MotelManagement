require "application_system_test_case"

class DevicesRoomsTest < ApplicationSystemTestCase
  setup do
    @devices_room = devices_rooms(:one)
  end

  test "visiting the index" do
    visit devices_rooms_url
    assert_selector "h1", text: "Devices Rooms"
  end

  test "creating a Devices room" do
    visit devices_rooms_url
    click_on "New Devices Room"

    fill_in "Datebegin", with: @devices_room.datebegin
    fill_in "Quantity", with: @devices_room.quantity
    fill_in "Status", with: @devices_room.status
    click_on "Create Devices room"

    assert_text "Devices room was successfully created"
    click_on "Back"
  end

  test "updating a Devices room" do
    visit devices_rooms_url
    click_on "Edit", match: :first

    fill_in "Datebegin", with: @devices_room.datebegin
    fill_in "Quantity", with: @devices_room.quantity
    fill_in "Status", with: @devices_room.status
    click_on "Update Devices room"

    assert_text "Devices room was successfully updated"
    click_on "Back"
  end

  test "destroying a Devices room" do
    visit devices_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Devices room was successfully destroyed"
  end
end
