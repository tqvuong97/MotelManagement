require "application_system_test_case"

class BillingsTest < ApplicationSystemTestCase
  setup do
    @billing = billings(:one)
  end

  test "visiting the index" do
    visit billings_url
    assert_selector "h1", text: "Billings"
  end

  test "creating a Billing" do
    visit billings_url
    click_on "New Billing"

    fill_in "Cleaner", with: @billing.cleaner
    fill_in "Electric", with: @billing.electric
    fill_in "Internet", with: @billing.internet
    fill_in "Laundry", with: @billing.laundry
    fill_in "Option1", with: @billing.option1
    fill_in "Option2", with: @billing.option2
    fill_in "Option3", with: @billing.option3
    fill_in "Parking", with: @billing.parking
    fill_in "Water", with: @billing.water
    click_on "Create Billing"

    assert_text "Billing was successfully created"
    click_on "Back"
  end

  test "updating a Billing" do
    visit billings_url
    click_on "Edit", match: :first

    fill_in "Cleaner", with: @billing.cleaner
    fill_in "Electric", with: @billing.electric
    fill_in "Internet", with: @billing.internet
    fill_in "Laundry", with: @billing.laundry
    fill_in "Option1", with: @billing.option1
    fill_in "Option2", with: @billing.option2
    fill_in "Option3", with: @billing.option3
    fill_in "Parking", with: @billing.parking
    fill_in "Water", with: @billing.water
    click_on "Update Billing"

    assert_text "Billing was successfully updated"
    click_on "Back"
  end

  test "destroying a Billing" do
    visit billings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Billing was successfully destroyed"
  end
end
