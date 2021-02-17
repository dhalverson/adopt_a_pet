require 'rails_helper'

RSpec.describe 'Shelter' do
  it 'as a visitor, I can create a new shelter' do

    visit '/shelters'

    expect(page).to have_link("New Shelter")
    click_link "New Shelter"

    expect(current_path).to eq('/shelters/new')
    expect(page).to have_content("Create New Shelter")
    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip")
    expect(page).to have_content("Open")
  end
end
