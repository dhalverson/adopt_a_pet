class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
    @weather = WeatherFacade.get_weather_forecast(@shelter.zip)
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

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    @shelter = Shelter.find(params[:id])
    @shelter.update(shelter_params)
    @shelter.save
    redirect_to "/shelters/#{@shelter.id}"
  end

  def destroy
    @shelter = Shelter.find(params[:id])
    @shelter.destroy
    redirect_to '/shelters'
  end

  private

  def shelter_params
    params.require(:shelter).permit(:name, :address, :city, :state, :zip, :hours_of_operation)
  end
end
