require 'rails_helper'

RSpec.describe 'as a visitor' do
  before(:each) do
    @shelter_1 = create(:shelter)
    @pet_1 = create(:pet, shelter: @shelter_1)
  end
  it 'I see a link to create a new pet on the shelters pets index page' do
    visit("/shelters/#{@shelter_1.id}/pets")

    expect(page).to have_link('Create Pet')
  end

  it 'From a shelters pets page, I can click create a new pet, fill out the attributes, and am redirected to the shelters pets page' do
    visit("/shelters/#{@shelter_1.id}/pets")

    click_link('Create Pet')
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets/new")

    fill_in 'Name', with: 'New Name'
    fill_in 'Age', with: 99
    select 'Male', :from => 'Sex'
    fill_in 'Breed', with: 'New Breed'
    fill_in 'Adopted', with: 'false'
    fill_in 'Description', with: 'New Description'
    select 'Dog', :from => 'Species'

    click_button('Create')
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")

    expect(page).to have_content('New Name')
  end
end
