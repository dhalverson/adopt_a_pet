class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip, :open)
  end

end
