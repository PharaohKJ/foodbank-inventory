class CreateStoreRoomExitContents < ActiveRecord::Migration[7.0]
  def change
    create_table :store_room_exit_contents do |t|
      t.string :code
      t.string :name
      t.references :store_room_exit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
