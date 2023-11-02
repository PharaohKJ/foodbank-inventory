require "application_system_test_case"

class DonationRequestsTest < ApplicationSystemTestCase
  setup do
    @donation_request = donation_requests(:one)
  end

  test "visiting the index" do
    visit donation_requests_url
    assert_selector "h1", text: "Donation requests"
  end

  test "should create donation request" do
    visit donation_requests_url
    click_on "New donation request"

    fill_in "Address", with: @donation_request.address
    fill_in "Company", with: @donation_request.company
    fill_in "Email", with: @donation_request.email
    fill_in "Name", with: @donation_request.name
    fill_in "Tel", with: @donation_request.tel
    click_on "Create Donation request"

    assert_text "Donation request was successfully created"
    click_on "Back"
  end

  test "should update Donation request" do
    visit donation_request_url(@donation_request)
    click_on "Edit this donation request", match: :first

    fill_in "Address", with: @donation_request.address
    fill_in "Company", with: @donation_request.company
    fill_in "Email", with: @donation_request.email
    fill_in "Name", with: @donation_request.name
    fill_in "Tel", with: @donation_request.tel
    click_on "Update Donation request"

    assert_text "Donation request was successfully updated"
    click_on "Back"
  end

  test "should destroy Donation request" do
    visit donation_request_url(@donation_request)
    click_on "Destroy this donation request", match: :first

    assert_text "Donation request was successfully destroyed"
  end
end
