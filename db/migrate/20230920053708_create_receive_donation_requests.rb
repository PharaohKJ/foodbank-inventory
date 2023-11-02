class CreateReceiveDonationRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :receive_donation_requests do |t|
      t.string :tel
      t.string :name
      t.datetime :scheduled_time
      t.boolean :accepted

      t.timestamps
    end
  end
end
