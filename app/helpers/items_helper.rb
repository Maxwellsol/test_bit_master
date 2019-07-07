module ItemsHelper
  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
            unless item.name == "Conjured"
              item.quality = item.quality - item.quality
            end
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      #
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end

  # обновляет качество в зависимости от имени
  def my_update_quality(item)
    # Для обычных item
    if item.name != "Aged Brie" and item.name != "Backstage passes to a ETC concert" and item.name != "Conjured"
      quality = item.quality - 1
    end
    # Для пропуска
    if item.name == "Backstage passes to a ETC concert"
      sell_in = item.sell_in
      quality = if sell_in.between?(11, 50)
                  item.quality + 1
                elsif sell_in.between?(6, 10)
                  item.quality + 2
                elsif sell_in.between?(1, 5)
                  item.quality + 3
                elsif sell_in < 0
                  0
                end
    end
    # для вина
    if item.name == "Aged Brie"
      quality = item.quality + 1
    end
    # для наколдованных предметов
    if item.name == "Conjured"
      quality = item.quality - 2
    end
    # зписывает quality
    item.update(quality: quality)
  end


end
