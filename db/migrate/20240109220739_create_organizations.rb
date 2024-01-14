class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :pic
      t.string :postal_code
      t.string :address
      t.string :email
      t.date :agreement_at
      t.string :tel
      t.string :fax

      t.timestamps
    end
  end
end
