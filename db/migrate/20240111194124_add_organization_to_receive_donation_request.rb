class AddOrganizationToReceiveDonationRequest < ActiveRecord::Migration[7.0]
  def change
    add_reference :receive_donation_requests, :organization, null: true, foreign_key: true
  end
end
