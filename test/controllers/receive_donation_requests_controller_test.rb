require "test_helper"

class ReceiveDonationRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receive_donation_request = receive_donation_requests(:one)
  end

  test "should get index" do
    get receive_donation_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_receive_donation_request_url
    assert_response :success
  end

  test "should create receive_donation_request" do
    assert_difference("ReceiveDonationRequest.count") do
      post receive_donation_requests_url, params: { receive_donation_request: { accepted: @receive_donation_request.accepted, name: @receive_donation_request.name, scheduled_time: @receive_donation_request.scheduled_time, tel: @receive_donation_request.tel } }
    end

    assert_redirected_to receive_donation_request_url(ReceiveDonationRequest.last)
  end

  test "should show receive_donation_request" do
    get receive_donation_request_url(@receive_donation_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_receive_donation_request_url(@receive_donation_request)
    assert_response :success
  end

  test "should update receive_donation_request" do
    patch receive_donation_request_url(@receive_donation_request), params: { receive_donation_request: { accepted: @receive_donation_request.accepted, name: @receive_donation_request.name, scheduled_time: @receive_donation_request.scheduled_time, tel: @receive_donation_request.tel } }
    assert_redirected_to receive_donation_request_url(@receive_donation_request)
  end

  test "should destroy receive_donation_request" do
    assert_difference("ReceiveDonationRequest.count", -1) do
      delete receive_donation_request_url(@receive_donation_request)
    end

    assert_redirected_to receive_donation_requests_url
  end
end
