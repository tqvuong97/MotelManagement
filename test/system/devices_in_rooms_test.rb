require "application_system_test_case"

class DevicesInRoomsTest < ApplicationSystemTestCase
  setup do
    @devices_in_room = devices_in_rooms(:one)
  end

  test "visiting the index" do
    visit devices_in_rooms_url
    assert_selector "h1", text: "Devices In Rooms"
  end

  test "creating a Devices in room" do
    visit devices_in_rooms_url
    click_on "New Devices In Room"

    fill_in "Datebegin", with: @devices_in_room.datebegin
    fill_in "Quantity", with: @devices_in_room.quantity
    fill_in "Status", with: @devices_in_room.status
    click_on "Create Devices in room"

    assert_text "Devices in room was successfully created"
    click_on "Back"
  end

  test "updating a Devices in room" do
    visit devices_in_rooms_url
    click_on "Edit", match: :first

    fill_in "Datebegin", with: @devices_in_room.datebegin
    fill_in "Quantity", with: @devices_in_room.quantity
    fill_in "Status", with: @devices_in_room.status
    click_on "Update Devices in room"

    assert_text "Devices in room was successfully updated"
    click_on "Back"
  end

  test "destroying a Devices in room" do
    visit devices_in_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Devices in room was successfully destroyed"
  end
end
