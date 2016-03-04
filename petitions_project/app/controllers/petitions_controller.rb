class PetitionsController < ApplicationController

  def index
    @petition = Petition.all
    render @petition.map{|p| p.title}.join("</br>")
  end

  def create
    @petition = Petition.new(petition_params)

    @petition.save
    redirect_to @petition
  end

  def new

  end

  def show
    @petition = Petition.find(params[:id])
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :text)
  end
end
