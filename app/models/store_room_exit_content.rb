class StoreRoomExitContent < ApplicationRecord
  belongs_to :store_room_exit

  def self.drive_code_map
    {
      '99900001': '菓子類',
      '99900002': '缶詰・瓶詰類',
      '99900003': '米・餅・粉・麺類',
      '99900004': '調味料類',
      '99900005': 'インスタント・レトルト類',
      '99900006': '飲料・嗜好品類',
      '99900007': '乾物類',
      '99900008': '乳児食・介護食・栄養補助食類',
      '99900009': 'その他'
    }
  end
end
