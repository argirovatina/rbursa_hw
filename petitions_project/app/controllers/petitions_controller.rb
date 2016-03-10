class PetitionsController < ApplicationController

  def index
    @petitions = Petition.all
    @users = User.all

  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(petition_params)
    @petition.user_id = current_user.id
    if @petition.save
      redirect_to @petition
    else
      render 'new'
    end
  end

  def show
    @petition = Petition.find(params[:id])
  end


  private
  def petition_params
    params.require(:petition).permit(:title, :text)
  end
end
