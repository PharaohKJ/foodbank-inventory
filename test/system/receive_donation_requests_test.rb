require "application_system_test_case"

class ReceiveDonationRequestsTest < ApplicationSystemTestCase
  setup do
    @receive_donation_request = receive_donation_requests(:one)
    @scheduled_at = @receive_donation_request.scheduled_at + 1.day
  end

  test "visiting the index" do
    visit receive_donation_requests_url
    assert_selector "h1", text: "Receive donation requests"
  end

  test "should create receive donation request" do
    visit receive_donation_requests_url
    click_on "New receive donation request"

    select @receive_donation_request.organization.name_with_id, from: "貴団体名"
    fill_in "当日ご担当者名(*)", with: @receive_donation_request.name
    fill_in "出庫訪問予定日(*)", with: @scheduled_at
    assert_field "出庫訪問予定日(*)", with: @scheduled_at.strftime("%Y-%m-%dT%H:%M")
    fill_in "当日連絡電話番号(*)", with: @receive_donation_request.tel
    click_on "申請します"

    assert_text "Receive donation request was successfully created"
    assert_selector "h1", text: "#{I18n.l(@scheduled_at, format: :long)} で申請を受け付けました。"
    click_on "申請の作成に戻る"
  end

  test "should update Receive donation request" do
    visit edit_receive_donation_request_url(@receive_donation_request)

    select @receive_donation_request.organization.name_with_id, from: "貴団体名"
    fill_in "当日ご担当者名(*)", with: @receive_donation_request.name
    fill_in "出庫訪問予定日(*)", with: @scheduled_at
    assert_field "出庫訪問予定日(*)", with: @scheduled_at.strftime("%Y-%m-%dT%H:%M")
    fill_in "当日連絡電話番号(*)", with: @receive_donation_request.tel
    click_on "申請します"

    assert_text "で申請を受け付けました。"
    assert_selector "h1", text: "#{I18n.l(@scheduled_at, format: :long)} で申請を受け付けました。"
    click_on "申請の作成に戻る"
  end

  test "should display existing Receive donation request" do
    visit receive_donation_requests_url
    assert_text @receive_donation_request.name
  end
end
