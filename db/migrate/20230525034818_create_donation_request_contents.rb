class CreateDonationRequestContents < ActiveRecord::Migration[7.0]
  def change
    create_table :donation_request_contents do |t|
      t.references :donation_request, null: false, foreign_key: true
      t.string :maker
      t.date :expiry_date
      t.integer :per_weight
      t.integer :per_case
      t.integer :count
      t.text :reason

      t.timestamps
    end
  end
end
