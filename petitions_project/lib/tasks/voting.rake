namespace :voting do

  task process_old: :environment do
    VotingEndingJob.perform_later
  end

end
