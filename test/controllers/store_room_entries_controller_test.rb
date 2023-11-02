require "test_helper"

class StoreRoomEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_room_entry = store_room_entries(:one)
  end

  test "should get index" do
    get store_room_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_store_room_entry_url
    assert_response :success
  end

  test "should create store_room_entry" do
    assert_difference("StoreRoomEntry.count") do
      post store_room_entries_url, params: { store_room_entry: { donation_request_id: @store_room_entry.donation_request_id } }
    end

    assert_redirected_to store_room_entry_url(StoreRoomEntry.last)
  end

  test "should show store_room_entry" do
    get store_room_entry_url(@store_room_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_room_entry_url(@store_room_entry)
    assert_response :success
  end

  test "should update store_room_entry" do
    patch store_room_entry_url(@store_room_entry), params: { store_room_entry: { donation_request_id: @store_room_entry.donation_request_id } }
    assert_redirected_to store_room_entry_url(@store_room_entry)
  end

  test "should destroy store_room_entry" do
    assert_difference("StoreRoomEntry.count", -1) do
      delete store_room_entry_url(@store_room_entry)
    end

    assert_redirected_to store_room_entries_url
  end
end
