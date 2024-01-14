require "application_system_test_case"

class StoreRoomExitContentsTest < ApplicationSystemTestCase
  setup do
    @store_room_exit_content = store_room_exit_contents(:one)
  end

  test "visiting the index" do
    visit store_room_exit_contents_url
    assert_selector "h1", text: "Store room exit contents"
  end

  test "should create store room exit content" do
    visit store_room_exit_contents_url
    click_on "New store room exit content"

    click_on "Create Store room exit content"

    assert_text "Store room exit content was successfully created"
    click_on "Back"
  end

  test "should update Store room exit content" do
    visit store_room_exit_content_url(@store_room_exit_content)
    click_on "Edit this store room exit content", match: :first

    click_on "Update Store room exit content"

    assert_text "Store room exit content was successfully updated"
    click_on "Back"
  end

  test "should destroy Store room exit content" do
    visit store_room_exit_content_url(@store_room_exit_content)
    click_on "Destroy this store room exit content", match: :first

    assert_text "Store room exit content was successfully destroyed"
  end
end
