class VotesController < ApplicationController

  def create
    @vote = Vote.new
    @petition = Petition.find(params[:id])
    @petition.votes.create(votes_params).save
    redirect_to @petition, notice: 'Ваш голос учтен'
  end

  def votes_params
    params.require(:vote).permit(:user_id, :petition_id)
  end
end
