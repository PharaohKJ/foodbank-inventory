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
      post store_room_exits_url, params: {
        store_room_exit: { from_receive_donation_request_id: organizations(:one).id }
      }
    end

    assert_redirected_to edit_store_room_exit_url(StoreRoomExit.last)
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
    patch store_room_exit_url(@store_room_exit), params: { commit: "この内容で出庫" }
    assert_redirected_to store_room_exit_url(@store_room_exit)
    assert_not @store_room_exit.reload.draft
    assert_not_nil @store_room_exit.exited_at
  end

  test "should destroy store_room_exit" do
    assert_difference("StoreRoomExit.count", -1) do
      delete store_room_exit_url(@store_room_exit)
    end

    assert_redirected_to store_room_exits_url
  end
end
