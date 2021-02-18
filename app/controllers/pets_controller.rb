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

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      flash[:success] = "#{@pet.name} updated!"
      redirect_to pet_path(@pet)
    else
      flash[:error] = @pet.errors.full_messages
      render action: :edit
    end
  end

private

  def pet_params
    params.require(:pet).permit(:name, :age, :sex, :breed, :adopted, :description, :species)
  end
end