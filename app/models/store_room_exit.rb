class StoreRoomExit < ApplicationRecord
  has_many :store_room_exit_contents, dependent: :destroy
end
