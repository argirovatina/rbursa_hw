class VotesController < ApplicationController

  MAX_VOTES = 100

  def create
    vote = current_user.votes.create(permitted_params)
    redirect_to vote.petition, notice: 'Спасибо! Ваш голос учтен'

    @petition = Petition.find(params[:petition_id])
    if @petition.votes.count == MAX_VOTES
      UserMailer.winning_petition(@petition).deliver_now
      UserMailer.email_to_admin(@petition).deliver_now
    else
      UserMailer.loosing_petition(@petition).deliver_now
    end
  end

  def max_votes_count
    @max_votes = MAX_VOTES
  end

  def permitted_params
    params.permit(:petition_id)
  end
end
