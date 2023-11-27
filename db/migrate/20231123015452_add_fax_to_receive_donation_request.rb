class AddFaxToReceiveDonationRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :receive_donation_requests, :fax, :string
    add_column :receive_donation_requests, :organization_name, :string
    add_column :receive_donation_requests, :reason, :string
    add_column :receive_donation_requests, :used_at, :datetime
    add_column :receive_donation_requests, :scheduled_at, :datetime
    add_column :receive_donation_requests, :accepted_at, :datetime
  end
end
