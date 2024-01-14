class Organization < ApplicationRecord
  has_one :entry_code
  has_many :receive_donation_requests

  def name_with_id
    "#{name}(#{id})"
  end
end
