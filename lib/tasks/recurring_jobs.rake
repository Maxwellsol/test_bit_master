namespace :recurring do

  task init: :environment do
    Delayed::Job.destroy_all
    UpdateQualityJob.schedule!
  end
end