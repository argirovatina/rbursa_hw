class VotingEndingJob < ActiveJob::Base
  queue_as :default

  def perform
    petition = Petition.all
    if Petition.expired?
      petition.first.destroy
    end
  end

end