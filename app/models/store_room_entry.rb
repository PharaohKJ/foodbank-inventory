require 'csv'
class StoreRoomEntry < ApplicationRecord
  belongs_to :donation_request
  has_many :store_room_entry_contents, dependent: :destroy
  accepts_nested_attributes_for :store_room_entry_contents, allow_destroy: true

  def self.parse_tsv(tsv_data)
    out = []
    CSV.parse(tsv_data, col_sep: "\t") do |row|
      next if StoreRoomEntryContent.find_by(barcode: row[0])
      out << StoreRoomEntryContent.new(
        barcode: row[0].to_s.gsub(/[^0-9]/,''),
        maker: row[4],
        name: row[3],
        content_type: row[1],
        weight: row[7].to_f * 1000
      )
    end
    out
  end
end
