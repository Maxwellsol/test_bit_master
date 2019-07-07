class UpdateQualityJob
  include ItemsHelper
  include Delayed::RecurringJob
  run_every 2.minutes
  timezone "Samara"

  def perform
    Item.where(legendary: false).each do |item|
      sell_in = item.sell_in - 1
      item.update(sell_in: sell_in)
      my_update_quality(item)
    end
  end
end
