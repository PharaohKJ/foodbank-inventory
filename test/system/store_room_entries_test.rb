require "application_system_test_case"

class StoreRoomEntriesTest < ApplicationSystemTestCase
  setup do
    @store_room_entry = store_room_entries(:one)
  end

  test "visiting the index" do
    visit store_room_entries_url
    assert_selector "h1", text: "Store room entries"
  end

  test "should create store room entry" do
    visit new_store_room_entry_url(donation_request_id: @store_room_entry.donation_request_id)

    click_on "エクセルのダウンロード"

    assert_text "Store room entry was successfully created"
  end

  test "should update Store room entry" do
    visit edit_store_room_entry_url(@store_room_entry)

    click_on "エクセルのダウンロード"

    assert_text "Store room entry was successfully updated"
  end

  test "should display existing Store room entry" do
    visit store_room_entries_url
    assert_text @store_room_entry.id.to_s
  end
end
