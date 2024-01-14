class CreateEntryCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :entry_codes do |t|
      t.string :code
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
