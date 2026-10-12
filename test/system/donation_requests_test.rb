require "application_system_test_case"

class DonationRequestsTest < ApplicationSystemTestCase
  setup do
    @donation_request = donation_requests(:one)
  end

  test "visiting the index" do
    visit donation_requests_url
    assert_selector "h1", text: "寄附申請一覧"
  end

  test "should create donation request" do
    visit new_donation_request_url

    fill_in "住所", with: @donation_request.address
    fill_in "寄附企業・団体名", with: @donation_request.company
    fill_in "メールアドレス", with: @donation_request.email
    fill_in "ご担当者名", with: @donation_request.name
    fill_in "TEL", with: @donation_request.tel
    click_on "寄附項目を追加"

    assert_text "Donation request was successfully created"
    click_on "Back to donation requests"
  end

  test "should update Donation request" do
    visit donation_request_url(@donation_request)
    click_on "Edit this donation request", match: :first

    fill_in "住所", with: @donation_request.address
    fill_in "寄附企業・団体名", with: @donation_request.company
    fill_in "メールアドレス", with: @donation_request.email
    fill_in "ご担当者名", with: @donation_request.name
    fill_in "TEL", with: @donation_request.tel
    click_on "修正する"

    assert_text "Donation request was successfully updated"
    click_on "Back"
  end

  test "should destroy Donation request" do
    visit donation_request_url(@donation_request)
    click_on "Destroy this donation request", match: :first

    assert_text "Donation request was successfully destroyed"
  end
end
