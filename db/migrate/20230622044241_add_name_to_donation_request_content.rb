class AddNameToDonationRequestContent < ActiveRecord::Migration[7.0]
  def change
    add_column :donation_request_contents, :name, :string
    add_column :donation_request_contents, :content_type, :integer
  end
end
