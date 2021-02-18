class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

private

  def pet_params
    params.require(:pet).permit(:name, :age, :sex, :breed, :adopted, :description, :species)
  end
end