class CreateDonationRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :donation_requests do |t|
      t.string :email
      t.string :company
      t.string :name
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
