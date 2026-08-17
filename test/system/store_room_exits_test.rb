require "application_system_test_case"

class StoreRoomExitsTest < ApplicationSystemTestCase
  setup do
    @store_room_exit = store_room_exits(:one)
    @receive_donation_request = receive_donation_requests(:one)
  end

  test "visiting the index" do
    visit store_room_exits_url
    assert_selector "h1", text: "出庫表一覧"
  end

  test "should create store room exit" do
    visit store_room_exits_url
    click_on "New store room exit"

    fill_in "store_room_exit_from_receive_donation_request_id", with: @receive_donation_request.organization_id
    click_on "出庫開始"

    assert_text "出庫申請を開始します"
  end

  test "should update Store room exit" do
    visit edit_store_room_exit_url(@store_room_exit)

    click_on "この内容で出庫", match: :first

    assert_text "出庫しました"
  end

  test "should display existing Store room exit" do
    visit store_room_exits_url
    assert_selector "#store_room_exits"
  end
end
