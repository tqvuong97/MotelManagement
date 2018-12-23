require 'test_helper'

class ServicesRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @services_room = services_rooms(:one)
  end

  test "should get index" do
    get services_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_services_room_url
    assert_response :success
  end

  test "should create services_room" do
    assert_difference('ServicesRoom.count') do
      post services_rooms_url, params: { services_room: { cleaner: @services_room.cleaner, datebegin: @services_room.datebegin, dateend: @services_room.dateend, electbegin: @services_room.electbegin, electend: @services_room.electend, internet: @services_room.internet, laundry: @services_room.laundry, option1: @services_room.option1, option2: @services_room.option2, option3: @services_room.option3, parking: @services_room.parking, waterbegin: @services_room.waterbegin, waterend: @services_room.waterend } }
    end

    assert_redirected_to services_room_url(ServicesRoom.last)
  end

  test "should show services_room" do
    get services_room_url(@services_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_services_room_url(@services_room)
    assert_response :success
  end

  test "should update services_room" do
    patch services_room_url(@services_room), params: { services_room: { cleaner: @services_room.cleaner, datebegin: @services_room.datebegin, dateend: @services_room.dateend, electbegin: @services_room.electbegin, electend: @services_room.electend, internet: @services_room.internet, laundry: @services_room.laundry, option1: @services_room.option1, option2: @services_room.option2, option3: @services_room.option3, parking: @services_room.parking, waterbegin: @services_room.waterbegin, waterend: @services_room.waterend } }
    assert_redirected_to services_room_url(@services_room)
  end

  test "should destroy services_room" do
    assert_difference('ServicesRoom.count', -1) do
      delete services_room_url(@services_room)
    end

    assert_redirected_to services_rooms_url
  end
end
