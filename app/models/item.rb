class Item < ApplicationRecord
  # общие правила для предметов
  validates :quality, numericality: {greater_than: -1, less_than: 51}
  before_save do
    if self.name.include?("Sulfuras, Hand of Ragnaros")
      self.sell_in = nil
      self.quality = 80
    end
  end
end
