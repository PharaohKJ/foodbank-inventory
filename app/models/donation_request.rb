class DonationRequest < ApplicationRecord
  has_many :donation_request_contents, dependent: :destroy
  has_one :store_room_entry, dependent: :destroy
  accepts_nested_attributes_for :donation_request_contents, allow_destroy: true
end
