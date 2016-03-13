class UsersController < ApplicationController

  def index
    redirect_to new_session_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to petitions_path, notice: 'Профиль успешно создан!'
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
