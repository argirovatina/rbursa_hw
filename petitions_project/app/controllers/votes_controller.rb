class VotesController < ApplicationController

  def create
    @vote = Vote.where(user_id: current_user.id, petition_id: current_petition.id)

  end

end
