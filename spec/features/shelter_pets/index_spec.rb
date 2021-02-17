require 'rails_helper'

RSpec.describe 'as a visitor' do
  before(:each) do
    @shelter_1 = create(:shelter)
    @pet_1 = create(:pet, shelter: @shelter_1)
  end
  it 'when I visit /shelters/:id/pets, I see all its pets' do
    visit("/shelters/#{@shelter_1.id}/pets")

    expect(page).to have_content("#{@shelter_1.name}'s Pets")
    pets.each do |pet|
      expect(page).to have_content(pet.name)
      expect(page).to have_content(pet.age)
      expect(page).to have_content(pet.sex)
      expect(page).to have_content(pet.breed)
      expect(page).to have_content(pet.adopted)
      expect(page).to have_content(pet.description)
      expect(page).to have_content(pet.species)
    end
  end
end