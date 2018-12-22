require "application_system_test_case"

class DevicesTest < ApplicationSystemTestCase
  setup do
    @device = devices(:one)
  end

  test "visiting the index" do
    visit devices_url
    assert_selector "h1", text: "Devices"
  end

  test "creating a Device" do
    visit devices_url
    click_on "New Device"

    fill_in "Branch", with: @device.branch
    fill_in "Name", with: @device.name
    fill_in "Price", with: @device.price
    fill_in "Quantity", with: @device.quantity
    fill_in "Status", with: @device.status
    click_on "Create Device"

    assert_text "Device was successfully created"
    click_on "Back"
  end

  test "updating a Device" do
    visit devices_url
    click_on "Edit", match: :first

    fill_in "Branch", with: @device.branch
    fill_in "Name", with: @device.name
    fill_in "Price", with: @device.price
    fill_in "Quantity", with: @device.quantity
    fill_in "Status", with: @device.status
    click_on "Update Device"

    assert_text "Device was successfully updated"
    click_on "Back"
  end

  test "destroying a Device" do
    visit devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Device was successfully destroyed"
  end
end
