require "application_system_test_case"

class StoreRoomExitsTest < ApplicationSystemTestCase
  setup do
    @store_room_exit = store_room_exits(:one)
  end

  test "visiting the index" do
    visit store_room_exits_url
    assert_selector "h1", text: "Store room exits"
  end

  test "should create store room exit" do
    visit store_room_exits_url
    click_on "New store room exit"

    click_on "Create Store room exit"

    assert_text "Store room exit was successfully created"
    click_on "Back"
  end

  test "should update Store room exit" do
    visit store_room_exit_url(@store_room_exit)
    click_on "Edit this store room exit", match: :first

    click_on "Update Store room exit"

    assert_text "Store room exit was successfully updated"
    click_on "Back"
  end

  test "should destroy Store room exit" do
    visit store_room_exit_url(@store_room_exit)
    click_on "Destroy this store room exit", match: :first

    assert_text "Store room exit was successfully destroyed"
  end
end
