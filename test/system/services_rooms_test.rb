require "application_system_test_case"

class ServicesRoomsTest < ApplicationSystemTestCase
  setup do
    @services_room = services_rooms(:one)
  end

  test "visiting the index" do
    visit services_rooms_url
    assert_selector "h1", text: "Services Rooms"
  end

  test "creating a Services room" do
    visit services_rooms_url
    click_on "New Services Room"

    fill_in "Cleaner", with: @services_room.cleaner
    fill_in "Datebegin", with: @services_room.datebegin
    fill_in "Dateend", with: @services_room.dateend
    fill_in "Electbegin", with: @services_room.electbegin
    fill_in "Electend", with: @services_room.electend
    fill_in "Internet", with: @services_room.internet
    fill_in "Laundry", with: @services_room.laundry
    fill_in "Option1", with: @services_room.option1
    fill_in "Option2", with: @services_room.option2
    fill_in "Option3", with: @services_room.option3
    fill_in "Parking", with: @services_room.parking
    fill_in "Waterbegin", with: @services_room.waterbegin
    fill_in "Waterend", with: @services_room.waterend
    click_on "Create Services room"

    assert_text "Services room was successfully created"
    click_on "Back"
  end

  test "updating a Services room" do
    visit services_rooms_url
    click_on "Edit", match: :first

    fill_in "Cleaner", with: @services_room.cleaner
    fill_in "Datebegin", with: @services_room.datebegin
    fill_in "Dateend", with: @services_room.dateend
    fill_in "Electbegin", with: @services_room.electbegin
    fill_in "Electend", with: @services_room.electend
    fill_in "Internet", with: @services_room.internet
    fill_in "Laundry", with: @services_room.laundry
    fill_in "Option1", with: @services_room.option1
    fill_in "Option2", with: @services_room.option2
    fill_in "Option3", with: @services_room.option3
    fill_in "Parking", with: @services_room.parking
    fill_in "Waterbegin", with: @services_room.waterbegin
    fill_in "Waterend", with: @services_room.waterend
    click_on "Update Services room"

    assert_text "Services room was successfully updated"
    click_on "Back"
  end

  test "destroying a Services room" do
    visit services_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Services room was successfully destroyed"
  end
end
