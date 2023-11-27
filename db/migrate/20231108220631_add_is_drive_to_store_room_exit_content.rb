class AddIsDriveToStoreRoomExitContent < ActiveRecord::Migration[7.0]
  def change
    add_column :store_room_exit_contents, :is_drive, :boolean, default: false
  end
end
