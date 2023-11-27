# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

dr = DonationRequest.create(
  email: 'example@example.net',
  company: 'サンプル寄附会社',
  name: 'サンプル寄附会社担当者',
  address: 'サンプル寄附会社住所',
  tel: '0762990123'
)


sre = StoreRoomEntry.create(donation_request_id: dr.id)

drc1 = dr.donation_request_contents.create(
  maker: 'メーカ1',
  expiry_date: Time.current + rand(1..6).months,
  per_weight: 100,
  per_case: 1,
  count: 10
)

drc2 = dr.donation_request_contents.create(
  maker: 'メーカ2',
  expiry_date: Time.current + rand(1..6).months,
  per_weight: 100,
  per_case: 1,
  count: 10
)
drc3 = dr.donation_request_contents.create(
  maker: 'メーカ3',
  expiry_date: Time.current + rand(1..6).months,
  per_weight: 100,
  per_case: 1,
  count: 10
)
drc4 = dr.donation_request_contents.create(
  maker: 'メーカ4',
  expiry_date: Time.current + rand(1..6).months,
  per_weight: 100,
  per_case: 1,
  count: 10
)

sre.store_room_entry_contents.create(
  barcode: '00000004',
  maker: 'メーカ1',
  name: '白米のサンプル',
  content_type: 3,
  donation_request_content_id: drc1.id
)

sre.store_room_entry_contents.create(
  barcode: '00000005',
  maker: 'メーカ2',
  name: '小麦粉のサンプル',
  content_type: 4,
  donation_request_content_id: drc2.id
)

sre.store_room_entry_contents.create(
  barcode: '00000006',
  maker: 'メーカ3',
  name: 'カレー粉のサンプル',
  content_type: 4,
  donation_request_content_id: drc3.id
)

sre.store_room_entry_contents.create(
  barcode: '00000007',
  maker: 'メーカ4',
  name: 'ツナ缶のサンプル',
  content_type: 2,
  donation_request_content_id: drc4.id
)





