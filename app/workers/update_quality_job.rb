class UpdateQualityJob
  include ItemsHelper
  include Delayed::RecurringJob

  # Запускается в определенное время(для задачи нужно run_every 1.day run_at 23:59)

  run_every 2.minutes
  timezone "Samara"

  def perform
    # выбирает все item, не являющиеся легендарными

    Item.where(legendary: false).each do |item|
      # Обновляет sell_in уменьшая на 1 день
      sell_in = item.sell_in - 1
      item.update(sell_in: sell_in)
      # запускает функцию обновления
      my_update_quality(item)
    end
  end
end
