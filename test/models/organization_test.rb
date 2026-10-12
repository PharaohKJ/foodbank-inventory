require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  test "fixture associations point to the organization" do
    organization = organizations(:one)

    assert_equal organization, entry_codes(:one).organization
    assert_equal organization, receive_donation_requests(:one).organization
  end

  test "destroying an organization destroys dependent records" do
    organization = organizations(:one)

    assert_difference("EntryCode.count", -1) do
      assert_difference("ReceiveDonationRequest.count", -1) do
        assert_difference("Organization.count", -1) do
          organization.destroy!
        end
      end
    end
  end
end
