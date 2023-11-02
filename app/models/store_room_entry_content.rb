class StoreRoomEntryContent < ApplicationRecord
  belongs_to :store_room_entry
  belongs_to :donation_request_content, optional: true
end
