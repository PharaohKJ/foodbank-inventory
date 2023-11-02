require "test_helper"

class DonationRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @donation_request = donation_requests(:one)
  end

  test "should get index" do
    get donation_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_donation_request_url
    assert_response :success
  end

  test "should create donation_request" do
    assert_difference("DonationRequest.count") do
      post donation_requests_url, params: { donation_request: { address: @donation_request.address, company: @donation_request.company, email: @donation_request.email, name: @donation_request.name, tel: @donation_request.tel } }
    end

    assert_redirected_to donation_request_url(DonationRequest.last)
  end

  test "should show donation_request" do
    get donation_request_url(@donation_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_donation_request_url(@donation_request)
    assert_response :success
  end

  test "should update donation_request" do
    patch donation_request_url(@donation_request), params: { donation_request: { address: @donation_request.address, company: @donation_request.company, email: @donation_request.email, name: @donation_request.name, tel: @donation_request.tel } }
    assert_redirected_to donation_request_url(@donation_request)
  end

  test "should destroy donation_request" do
    assert_difference("DonationRequest.count", -1) do
      delete donation_request_url(@donation_request)
    end

    assert_redirected_to donation_requests_url
  end
end
