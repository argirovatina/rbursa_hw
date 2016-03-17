class VotesController < ApplicationController

  MAX_VOTES = 100

  def create
    @vote = Vote.new
    @petition = Petition.find(params[:id])
    @petition.votes.create(votes_params).save
    if @vote.count == MAX_VOTES
      UserMailer.winning_petition(@petition).deliver_now
    else
      UserMailer.loosing_petition(@petition).deliver_now
    end
    redirect_to @petition, notice: 'Ваш голос учтен'
  end

  def votes_params
    params.require(:vote).permit(:user_id, :petition_id)
  end
end
