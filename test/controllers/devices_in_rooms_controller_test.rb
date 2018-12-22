require 'test_helper'

class DevicesInRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @devices_in_room = devices_in_rooms(:one)
  end

  test "should get index" do
    get devices_in_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_devices_in_room_url
    assert_response :success
  end

  test "should create devices_in_room" do
    assert_difference('DevicesInRoom.count') do
      post devices_in_rooms_url, params: { devices_in_room: { datebegin: @devices_in_room.datebegin, quantity: @devices_in_room.quantity, status: @devices_in_room.status } }
    end

    assert_redirected_to devices_in_room_url(DevicesInRoom.last)
  end

  test "should show devices_in_room" do
    get devices_in_room_url(@devices_in_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_devices_in_room_url(@devices_in_room)
    assert_response :success
  end

  test "should update devices_in_room" do
    patch devices_in_room_url(@devices_in_room), params: { devices_in_room: { datebegin: @devices_in_room.datebegin, quantity: @devices_in_room.quantity, status: @devices_in_room.status } }
    assert_redirected_to devices_in_room_url(@devices_in_room)
  end

  test "should destroy devices_in_room" do
    assert_difference('DevicesInRoom.count', -1) do
      delete devices_in_room_url(@devices_in_room)
    end

    assert_redirected_to devices_in_rooms_url
  end
end
