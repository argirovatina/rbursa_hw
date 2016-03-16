class SessionsController < ApplicationController

    def new
      render 'new'
    end

    def create
      user = User.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: "Спасибо, что вернулись к нам, #{user.email}"
      else
        flash.now.alert = 'Неправильный адрес почты или пароль'
        render 'new'
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Вы вышли из системы!'
    end
end
