class Organization < ApplicationRecord
  has_one :entry_code, dependent: :destroy
  has_many :receive_donation_requests, dependent: :destroy

  def name_with_id
    "#{name}(#{id})"
  end
end
