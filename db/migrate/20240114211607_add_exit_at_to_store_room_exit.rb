class AddExitAtToStoreRoomExit < ActiveRecord::Migration[7.0]
  def change
    add_column :store_room_exits, :exited_at, :datetime
  end
end
