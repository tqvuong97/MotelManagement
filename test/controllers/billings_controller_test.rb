require 'test_helper'

class BillingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @billing = billings(:one)
  end

  test "should get index" do
    get billings_url
    assert_response :success
  end

  test "should get new" do
    get new_billing_url
    assert_response :success
  end

  test "should create billing" do
    assert_difference('Billing.count') do
      post billings_url, params: { billing: { cleaner: @billing.cleaner, electric: @billing.electric, internet: @billing.internet, laundry: @billing.laundry, option1: @billing.option1, option2: @billing.option2, option3: @billing.option3, parking: @billing.parking, water: @billing.water } }
    end

    assert_redirected_to billing_url(Billing.last)
  end

  test "should show billing" do
    get billing_url(@billing)
    assert_response :success
  end

  test "should get edit" do
    get edit_billing_url(@billing)
    assert_response :success
  end

  test "should update billing" do
    patch billing_url(@billing), params: { billing: { cleaner: @billing.cleaner, electric: @billing.electric, internet: @billing.internet, laundry: @billing.laundry, option1: @billing.option1, option2: @billing.option2, option3: @billing.option3, parking: @billing.parking, water: @billing.water } }
    assert_redirected_to billing_url(@billing)
  end

  test "should destroy billing" do
    assert_difference('Billing.count', -1) do
      delete billing_url(@billing)
    end

    assert_redirected_to billings_url
  end
end
