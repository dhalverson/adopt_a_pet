class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    @shelter = Shelter.new(shelter_params)
    if @shelter.save
      flash[:success] = "Nice! Shelter Created!"
      redirect_to '/shelters'
    else
      flash[:error] = @shelter.errors.full_messages.to_sentence
      redirect_to '/shelters/new'
    end
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip, :open)
  end

end
