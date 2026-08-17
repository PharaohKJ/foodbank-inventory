require "test_helper"

class StoreRoomEntryTest < ActiveSupport::TestCase
  test "belongs to its donation request" do
    assert_equal donation_requests(:one), store_room_entries(:one).donation_request
  end

  test "loads the CSV standard library" do
    assert defined?(CSV::Parser)
  end
end
