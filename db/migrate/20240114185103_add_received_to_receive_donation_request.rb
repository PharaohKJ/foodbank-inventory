class AddReceivedToReceiveDonationRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :receive_donation_requests, :received_at, :datetime
    add_column :receive_donation_requests, :received, :boolean, default: false
  end
end
