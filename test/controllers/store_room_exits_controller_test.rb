require "test_helper"

class StoreRoomExitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_room_exit = store_room_exits(:one)
  end

  test "should get index" do
    get store_room_exits_url
    assert_response :success
  end

  test "should get new" do
    get new_store_room_exit_url
    assert_response :success
  end

  test "should create store_room_exit" do
    assert_difference("StoreRoomExit.count") do
      post store_room_exits_url, params: { store_room_exit: {  } }
    end

    assert_redirected_to store_room_exit_url(StoreRoomExit.last)
  end

  test "should show store_room_exit" do
    get store_room_exit_url(@store_room_exit)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_room_exit_url(@store_room_exit)
    assert_response :success
  end

  test "should update store_room_exit" do
    patch store_room_exit_url(@store_room_exit), params: { store_room_exit: {  } }
    assert_redirected_to store_room_exit_url(@store_room_exit)
  end

  test "should destroy store_room_exit" do
    assert_difference("StoreRoomExit.count", -1) do
      delete store_room_exit_url(@store_room_exit)
    end

    assert_redirected_to store_room_exits_url
  end
end
