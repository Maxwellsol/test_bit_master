class Item < ApplicationRecord
  # общие правила для предметов
  validates :quality, numericality: {greater_than: -1, less_than: 51}, unless: :legendary
  before_save do
    if self.legendary?
      self.quality = 80
      self.sell_in = nil
    end
  end

end
