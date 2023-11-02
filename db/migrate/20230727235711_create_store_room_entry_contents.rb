class CreateStoreRoomEntryContents < ActiveRecord::Migration[7.0]
  def change
    create_table :store_room_entry_contents do |t|
      t.references :store_room_entry, null: false, foreign_key: true
      t.string :barcode
      t.string :maker
      t.string :name
      t.integer :content_type
      t.references :donation_request_content, null: true, foreign_key: true

      t.timestamps
    end
  end
end
