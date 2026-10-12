require "test_helper"

class ReceiveDonationRequestTest < ActiveSupport::TestCase
  test "belongs to its organization" do
    assert_equal organizations(:one), receive_donation_requests(:one).organization
  end
end
