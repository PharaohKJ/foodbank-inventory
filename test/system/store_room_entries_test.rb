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
    visit store_room_entries_url
    click_on "New store room entry"

    fill_in "Donation request", with: @store_room_entry.donation_request_id
    click_on "Create Store room entry"

    assert_text "Store room entry was successfully created"
    click_on "Back"
  end

  test "should update Store room entry" do
    visit store_room_entry_url(@store_room_entry)
    click_on "Edit this store room entry", match: :first

    fill_in "Donation request", with: @store_room_entry.donation_request_id
    click_on "Update Store room entry"

    assert_text "Store room entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Store room entry" do
    visit store_room_entry_url(@store_room_entry)
    click_on "Destroy this store room entry", match: :first

    assert_text "Store room entry was successfully destroyed"
  end
end
