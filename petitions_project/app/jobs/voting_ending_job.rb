class VotingEndingJob < ActiveJob::Base
  queue_as :default

  def perform
    Petition::expired?
  end

end