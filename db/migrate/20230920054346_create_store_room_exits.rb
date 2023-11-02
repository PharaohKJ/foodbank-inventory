class CreateStoreRoomExits < ActiveRecord::Migration[7.0]
  def change
    create_table :store_room_exits do |t|
      t.boolean :draft, default: true
      t.integer :from_receive_donation_request_id
      t.timestamps
    end
  end
end
