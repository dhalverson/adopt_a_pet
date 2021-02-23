require 'rails_helper'

RSpec.describe 'Shelter' do
  it 'as a visitor, I can create a new shelter' do

    visit(shelters_path)

    expect(page).to have_link("New Shelter")
    click_link "New Shelter"

    expect(current_path).to eq(new_shelter_path)
    expect(page).to have_content("Create New Shelter")
    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip")
    expect(page).to have_content("Open")

    fill_in 'Name', with: "Corgi Shelter"
    fill_in 'Address', with: "2468 Corgi Drive"
    fill_in 'City', with: "Denver"
    fill_in 'State', with: "CO"
    fill_in 'Zip', with: "80209"
    select 'True', :from => 'Open'

    click_on "Create"

    expect(current_path).to eq(shelters_path)
    expect(Shelter.count).to eq(1)
    expect(page).to have_content("Corgi Shelter")
    expect(page).to have_content("2468 Corgi Drive")
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")
    expect(page).to have_content("80209")
    expect(page).to have_content(true)
  end

  it 'displays a flash message if a field is missing' do

    visit(new_shelter_path)

    fill_in 'Name', with: "Corgis"
    fill_in 'City', with: "Denver"
    fill_in 'State', with: "CO"
    fill_in 'Zip', with: "80209"
    select 'True', :from => 'Open'

    click_on "Create"

    expect(current_path).to eq(new_shelter_path)
    expect(Shelter.count).to eq(0)
    expect(page).to have_content("Address can't be blank")
  end
end
