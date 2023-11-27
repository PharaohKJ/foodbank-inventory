class AddContentTypeToStoreRoomExitContent < ActiveRecord::Migration[7.0]
  def change
    add_column :store_room_exit_contents, :content_type, :integer
  end
end
