require 'csv'

csv_file_path = 'db/first-data-item.csv'

CSV.foreach(csv_file_path, headers: true, col_sep: "\t") do |row|
  next if StoreRoomEntryContent.find_by(barcode: row[0])
  s = StoreRoomEntryContent.create!(
    barcode: row[0].to_s.gsub(/[^0-9]/,''),
    maker: row[4],
    name: row[3],
    content_type: row[1],
    weight: row[7].to_f * 1000
  )
end

csv_file_path = 'db/first-data-organizations.csv'

CSV.foreach(csv_file_path, headers: true) do |row|
  next if Organization.find_by(name: row[2])
  s = Organization.create!(
    name: row[2],
    pic: row[3],
    postal_code: row[4],
    address: row[5],
    email: row[6],
    #agreement_at: row[7],
    tel: row[8],
    fax: row[9]
  )
end

csv_file_path = 'db/first-data-organizations2.csv'

CSV.foreach(csv_file_path) do |row|
  next if Organization.find_by(name: row[2])
  s = Organization.create!(
    name: row[2],
    pic: row[5],
    # postal_code: row[4],
    address: row[4],
    email: row[6],
    #agreement_at: row[7],
    # tel: row[8],
    # fax: row[9]
  )
end

Organization.all.each do |o|
  code = EntryCode.new

end