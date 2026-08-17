require "test_helper"

class DonationRequestTest < ActiveSupport::TestCase
  test "fixture associations point to the donation request" do
    donation_request = donation_requests(:one)

    assert_equal donation_request, donation_request_contents(:one).donation_request
    assert_equal donation_request, store_room_entries(:one).donation_request
  end

  test "destroying a donation request destroys its dependent records" do
    donation_request = donation_requests(:one)

    assert_difference("DonationRequestContent.count", -1) do
      assert_difference("StoreRoomEntry.count", -1) do
        assert_difference("DonationRequest.count", -1) do
          donation_request.destroy!
        end
      end
    end
  end
end
