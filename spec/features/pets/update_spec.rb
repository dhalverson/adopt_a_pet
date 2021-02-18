require 'rails_helper'

RSpec.describe 'as a visitor' do
  before(:each) do
    @pet_1 = create(:pet)
  end
  it 'when I visit a pets show page, I see a link to update that pet' do
    visit(pet_path(@pet_1))

    expect(page).to have_link('Edit')
  end

  it 'I can update a pets information, save, and am redirected back to the show page' do
    visit(pet_path(@pet_1))
    
    click_link('Edit')
    expect(current_path).to eq(edit_pet(@pet_1))

    fill_in 'Name', with: 'New Name'
    fill_in 'Age', with: 100
    fill_in 'sex', with: 'Male'
    fill_in 'breed', with: 'Corgi'
    fill_in 'adopted', with: false
    fill_in 'description', with: 'New description text goes here'
    fill_in 'species', with: 'dog'

    click_button('Update')
    expect(current_path).to_eq(pet_path(@pet_1))

  end
end