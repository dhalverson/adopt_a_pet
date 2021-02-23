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
      flash[:error] = @pet.errors.full_messages.to_sentence
      render action: :edit
    end
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    @pet = @shelter.pets.create!(pet_params)
    if @pet.save
      flash[:success] = "#{@pet.name} created!"
      redirect_to "/shelters/#{@pet.shelter.id}/pets"
    else
      flash[:error] = @pet.errors.full_messages.to_sentence
      render action: :new
    end
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    redirect_to pets_path
  end

private

  def pet_params
    params.require(:pet).permit(:name, :age, :sex, :breed, :adopted, :description, :species, :id)
  end
end
