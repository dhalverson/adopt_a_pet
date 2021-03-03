require 'rails_helper'

RSpec.describe 'Pet' do
  it 'as a visitor, I see a single pets information' do
    lucy = create(:pet, name: 'Lucy')
    visit(pet_path(lucy))

    expect(page).to have_content(lucy.name)

    expect(page).to have_content(lucy.age)
    expect(page).to have_content(lucy.sex)
    expect(page).to have_content(lucy.breed)
    expect(page).to have_content(lucy.adopted)
    expect(page).to have_content(lucy.description)
    expect(page).to have_content(lucy.species)
  end
end   