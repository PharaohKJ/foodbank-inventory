class StoreRoomEntry < ApplicationRecord
  belongs_to :donation_request
  has_many :store_room_entry_contents, dependent: :destroy
  accepts_nested_attributes_for :store_room_entry_contents, allow_destroy: true
end
