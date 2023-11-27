class AddWeightToStoreRoomExitContent < ActiveRecord::Migration[7.0]
  def change
    add_column :store_room_exit_contents, :weight, :integer
  end
end
