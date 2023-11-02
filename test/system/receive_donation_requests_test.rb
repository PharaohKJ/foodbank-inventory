require "application_system_test_case"

class ReceiveDonationRequestsTest < ApplicationSystemTestCase
  setup do
    @receive_donation_request = receive_donation_requests(:one)
  end

  test "visiting the index" do
    visit receive_donation_requests_url
    assert_selector "h1", text: "Receive donation requests"
  end

  test "should create receive donation request" do
    visit receive_donation_requests_url
    click_on "New receive donation request"

    check "Accepted" if @receive_donation_request.accepted
    fill_in "Name", with: @receive_donation_request.name
    fill_in "Scheduled time", with: @receive_donation_request.scheduled_time
    fill_in "Tel", with: @receive_donation_request.tel
    click_on "Create Receive donation request"

    assert_text "Receive donation request was successfully created"
    click_on "Back"
  end

  test "should update Receive donation request" do
    visit receive_donation_request_url(@receive_donation_request)
    click_on "Edit this receive donation request", match: :first

    check "Accepted" if @receive_donation_request.accepted
    fill_in "Name", with: @receive_donation_request.name
    fill_in "Scheduled time", with: @receive_donation_request.scheduled_time
    fill_in "Tel", with: @receive_donation_request.tel
    click_on "Update Receive donation request"

    assert_text "Receive donation request was successfully updated"
    click_on "Back"
  end

  test "should destroy Receive donation request" do
    visit receive_donation_request_url(@receive_donation_request)
    click_on "Destroy this receive donation request", match: :first

    assert_text "Receive donation request was successfully destroyed"
  end
end
