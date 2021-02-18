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
    expect(current_path).to eq(edit_pet_path(@pet_1))

    fill_in 'Name', with: 'New Name'
    fill_in 'Age', with: 100
    select 'Male', :from => 'Sex'
    fill_in 'Breed', with: 'Corgi'
    fill_in 'Adopted', with: false
    fill_in 'Description', with: 'New description text goes here'
    select 'Dog', :from => 'Species'

    click_button('Update')
    expect(current_path).to eq(pet_path(@pet_1))
    within('div#name') do
      expect(page).to have_content('New Name')
    end
    expect(page).to have_content(100)
    expect(page).to have_content('Male')
    expect(page).to have_content('Corgi')
    expect(page).to have_content('false')
    expect(page).to have_content('New description text goes here')
    expect(page).to have_content('Dog')
  end
end