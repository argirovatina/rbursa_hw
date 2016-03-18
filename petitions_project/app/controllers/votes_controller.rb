class VotesController < ApplicationController

  def create
    vote = current_user.votes.create(permitted_params)
    redirect_to vote.petition, notice: 'Спасибо! Ваш голос учтен'
  end

  def permitted_params
    params.permit(:petition_id)
   end 
end
