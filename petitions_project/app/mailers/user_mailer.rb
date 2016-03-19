class UserMailer < ApplicationMailer

  def winning_petition(petition)
    preparing_params(petition)
    mail to: @user.email, subject: 'Ваша петиция набрала более 100 голосов'
  end

  def email_to_admin(petition)
    preparing_params(petition)
    mail to: 'test@test.com', subject: 'Рассмотрите петицию'
  end

  def loosing_petition(petition)
    preparing_params(petition)
    mail to: @user.email, subject: 'Ваша петиция не набрала более 100 голосов'
  end

  def preparing_params(petition)
    @petition = petition
    @user = petition.user
    @max_votes = VotesController.new.max_votes_count
    @votes = petition.votes
  end

end
