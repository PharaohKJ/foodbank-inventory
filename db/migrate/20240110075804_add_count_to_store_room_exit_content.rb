class AddCountToStoreRoomExitContent < ActiveRecord::Migration[7.0]
  def change
    add_column :store_room_exit_contents, :count, :integer, default: 1
  end
end
