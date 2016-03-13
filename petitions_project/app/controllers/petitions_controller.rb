class PetitionsController < ApplicationController

  def index
    if params[:my] && current_user
      @petitions = Petition.where(user_id: current_user.id).reverse
      @title = 'Мои петиции'
    else
      @petitions = Petition.all.reverse
      @title = 'Все петиции'
    end
    @users = User.all
  end

  def index_last
    @petitions = Petition.last(10).reverse
    @users = User.all
    @title = 'Последние петиции'
    render 'index'
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(petition_params)
    @petition.user_id = current_user.id unless current_user.nil?
    if @petition.save
      redirect_to @petition, notice: 'Создана новая петиция'
    else
      render 'new'
    end
  end

  def edit

  end


  def show
    @petition = Petition.find(params[:id])
  end

  private
  def petition_params
    params.require(:petition).permit(:title, :text) if params[:petition]
  end



end
