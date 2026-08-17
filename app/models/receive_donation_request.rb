class ReceiveDonationRequest < ApplicationRecord
  belongs_to :organization, optional: true
end
