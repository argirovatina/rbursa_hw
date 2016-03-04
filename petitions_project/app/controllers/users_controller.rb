class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(param[:user])
    if user.save
      redirect_to root_url, notice 'Профиль успешно создан! '
    end
  else
    render new
  end
end
