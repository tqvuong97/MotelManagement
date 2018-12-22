require 'test_helper'

class DevicesRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @devices_room = devices_rooms(:one)
  end

  test "should get index" do
    get devices_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_devices_room_url
    assert_response :success
  end

  test "should create devices_room" do
    assert_difference('DevicesRoom.count') do
      post devices_rooms_url, params: { devices_room: { datebegin: @devices_room.datebegin, quantity: @devices_room.quantity, status: @devices_room.status } }
    end

    assert_redirected_to devices_room_url(DevicesRoom.last)
  end

  test "should show devices_room" do
    get devices_room_url(@devices_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_devices_room_url(@devices_room)
    assert_response :success
  end

  test "should update devices_room" do
    patch devices_room_url(@devices_room), params: { devices_room: { datebegin: @devices_room.datebegin, quantity: @devices_room.quantity, status: @devices_room.status } }
    assert_redirected_to devices_room_url(@devices_room)
  end

  test "should destroy devices_room" do
    assert_difference('DevicesRoom.count', -1) do
      delete devices_room_url(@devices_room)
    end

    assert_redirected_to devices_rooms_url
  end
end
