require "application_system_test_case"

class StoreRoomExitContentsTest < ApplicationSystemTestCase
  setup do
    @store_room_exit_content = store_room_exit_contents(:one)
    @store_room_exit = @store_room_exit_content.store_room_exit
  end

  test "visiting the index" do
    visit store_room_exit_store_room_exit_contents_url(@store_room_exit)
    assert_selector "h1", text: "Store room exit contents"
  end

  test "should create store room exit content" do
    visit new_store_room_exit_store_room_exit_content_url(@store_room_exit)

    fill_in "総個数", with: 1
    fill_in "総重さ(kg)", with: 1
    click_on "重さと個数を登録"

    assert_text "ドライブの品を追加しました。"
  end

  test "should update Store room exit content" do
    visit edit_store_room_exit_store_room_exit_content_url(@store_room_exit, @store_room_exit_content)

    fill_in "総個数", with: 1
    fill_in "総重さ(kg)", with: 1
    click_on "重さと個数を登録"

    assert_text "Store room exit content was successfully updated"
    assert_text "Store room exit content was successfully updated"
  end

  test "should destroy Store room exit content" do
    visit store_room_exit_store_room_exit_content_url(@store_room_exit, @store_room_exit_content)
    click_on "Destroy this store room exit content", match: :first

    assert_text "#{@store_room_exit_content.name} を削除しました."
  end
end
