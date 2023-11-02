class CreateStoreRoomEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :store_room_entries do |t|
      t.references :donation_request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
