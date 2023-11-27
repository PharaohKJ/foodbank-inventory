class AddWeightToStoreRoomEntryContent < ActiveRecord::Migration[7.0]
  def change
    add_column :store_room_entry_contents, :weight, :integer
  end
end
