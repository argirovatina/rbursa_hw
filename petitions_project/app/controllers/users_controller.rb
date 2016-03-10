class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice 'Профиль успешно создан!'
    end
  else
    render new
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :last_name, :password, :confirm_password)
  end
end
