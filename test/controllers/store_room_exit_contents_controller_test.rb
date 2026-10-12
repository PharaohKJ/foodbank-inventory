require "test_helper"

class StoreRoomExitContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_room_exit = store_room_exits(:one)
    @store_room_exit_content = store_room_exit_contents(:one)
  end

  test "should get index" do
    get store_room_exit_store_room_exit_contents_url(@store_room_exit)
    assert_response :success
  end

  test "should get new" do
    get new_store_room_exit_store_room_exit_content_url(@store_room_exit)
    assert_response :success
  end

  test "should create store_room_exit_content" do
    assert_difference("StoreRoomExitContent.count") do
      post store_room_exit_store_room_exit_contents_url(@store_room_exit), params: {
        store_room_exit_content: {
          code: "new-code",
          content_type: 1,
          count: 1,
          is_drive: false,
          name: "New content",
          store_room_exit_id: @store_room_exit.id,
          weight: 1.5
        }
      }
    end

    assert_redirected_to edit_store_room_exit_url(@store_room_exit)
  end

  test "should show store_room_exit_content" do
    get store_room_exit_store_room_exit_content_url(@store_room_exit, @store_room_exit_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_room_exit_store_room_exit_content_url(@store_room_exit, @store_room_exit_content)
    assert_response :success
  end

  test "should update store_room_exit_content" do
    patch store_room_exit_store_room_exit_content_url(@store_room_exit, @store_room_exit_content), params: {
      store_room_exit_content: { name: "Updated content" }
    }
    assert_redirected_to store_room_exit_store_room_exit_content_url(@store_room_exit, @store_room_exit_content)
  end

  test "should destroy store_room_exit_content" do
    assert_difference("StoreRoomExitContent.count", -1) do
      delete store_room_exit_store_room_exit_content_url(@store_room_exit, @store_room_exit_content)
    end

    assert_redirected_to edit_store_room_exit_url(@store_room_exit)
  end
end
