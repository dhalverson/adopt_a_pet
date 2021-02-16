require 'rails_helper'

RSpec.describe 'Pet' do
  it 'as a visitor, I can see all exisiting pets' do
    pets = create_list(:pet, 3)

    visit(pets_path)

    expect(page).to have_content('All Pets')
    pets.each do |pet|
      expect(page).to have_content(pet.name)
      expect(page).to have_content(pet.age)
      expect(page).to have_content(pet.sex)
      expect(page).to have_content(pet.type)
      expect(page).to have_content(pet.adopted)
      expect(page).to have_content(pet.description)
    end
  end
end