class VotesController < ApplicationController

  def create
    @vote = Vote.create(votes_params)
    redirect_to @vote.petition, notice: 'Ваш голос учтен'
  end

  def votes_params
    params.permit(:petition_id)
  end
end
