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
    items = [store_room_entry_contents(:one), store_room_entry_contents(:two)]
    items.first.update!(barcode: "4901234567894", name: "テスト食品1", weight: 1_000)
    items.last.update!(barcode: "4901234567801", name: "テスト食品2", weight: 2_000)

    visit store_room_exits_url
    click_on "New store room exit"

    fill_in "store_room_exit_from_receive_donation_request_id", with: @receive_donation_request.organization_id
    click_on "出庫開始"

    assert_text "出庫申請を開始します"
    store_room_exit = StoreRoomExit.order(:id).last
    assert_current_path edit_store_room_exit_path(store_room_exit)
    assert_selector "table tbody tr", count: 0

    items.each_with_index do |item, index|
      fill_in "ここでバーコードをスキャンしてください", with: item.barcode
      click_on "バーコードで追加"

      assert_text "#{item.name}を追加しました"
      assert_selector "table tbody tr", count: index + 1
      within("table tbody tr", text: item.barcode) do
        assert_selector "td", text: item.name, exact_text: true
        assert_selector "td", text: "1", exact_text: true
      end
      assert_text "現在: #{index + 1} 個 / 50個"
    end

    drive_code = "99900001"
    fill_in "ここでバーコードをスキャンしてください", with: drive_code
    click_on "バーコードで追加"

    assert_current_path new_store_room_exit_store_room_exit_content_path(store_room_exit, code: drive_code)
    assert_selector "h1", text: "フードドライブの場合、個数・重さを入力してください。"
    assert_field "名前", with: "菓子類", readonly: true
    assert_field "store_room_exit_content_code", with: drive_code, type: :hidden, visible: false
    assert_field "store_room_exit_content_content_type", with: drive_code, type: :hidden, visible: false
    assert_field "store_room_exit_content_is_drive", with: "true", type: :hidden, visible: false
    assert_field "store_room_exit_content_store_room_exit_id", with: store_room_exit.id.to_s, type: :hidden, visible: false
    assert_equal 2, store_room_exit.store_room_exit_contents.count

    fill_in "総個数", with: 3
    fill_in "総重さ(kg)", with: "1.25"
    click_on "重さと個数を登録"

    assert_text "ドライブの品を追加しました。"
    assert_current_path edit_store_room_exit_path(store_room_exit)
    assert_selector "table tbody tr", count: 3
    within("table tbody tr", text: "菓子類") do
      assert_text "(番号なし)"
      assert_selector "td", text: "菓子類", exact_text: true
      assert_selector "td", text: "3", exact_text: true
      assert_selector "td", text: "1.25", exact_text: true
    end
    assert_text "現在: 5 個 / 50個"

    click_on "この内容で出庫", match: :first

    assert_text "出庫しました"
    assert_current_path store_room_exit_path(store_room_exit)
    assert_not store_room_exit.reload.draft
    assert_not_nil store_room_exit.exited_at
    assert_equal (items.map(&:barcode) + [drive_code]).sort, store_room_exit.store_room_exit_contents.pluck(:code).sort
    drive_content = store_room_exit.store_room_exit_contents.find_by!(code: drive_code)
    assert drive_content.is_drive
    assert_equal "菓子類", drive_content.name
    assert_equal drive_code.to_i, drive_content.content_type
    assert_equal 3, drive_content.count
    assert_equal 1_250, drive_content.weight

    page.refresh

    assert_text "合計 5 個"
    items.each do |item|
      within("table tbody tr", text: item.barcode) do
        assert_selector "td", text: item.name, exact_text: true
        assert_selector "td", text: "1 個", exact_text: true
        assert_selector "td", text: "#{format("%.2f", item.weight / 1_000.0)} kg", exact_text: true
      end
    end
    within("table tbody tr", text: "菓子類") do
      assert_text "(番号なし)"
      assert_selector "td", text: "菓子類", exact_text: true
      assert_selector "td", text: "3 個", exact_text: true
      assert_selector "td", text: "1.25 kg", exact_text: true
    end
    within("table tbody tr", text: "計") do
      assert_selector "td", text: "5 個", exact_text: true
      assert_selector "td", text: "4.25", exact_text: true
    end
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
