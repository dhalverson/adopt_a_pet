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

    fill_in :name, with: "Corgi Shelter"
    fill_in :address, with: "2468 Corgi Drive"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80209"
    select 'True', :from => 'Open'

    click_on "Create"

    expect(current_path).to eq('/shelters')
    expect(Shelter.count).to eq(1)
    expect(page).to have_content("Corgi Shelter")
    expect(page).to have_content("2468 Corgi Drive")
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")
    expect(page).to have_content("80209")
    expect(page).to have_content(true)
  end

  it 'displays a flash message if a field is missing' do

    visit '/shelters/new'

    fill_in :name, with: "Corgis"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80209"
    select 'True', :from => 'Open'

    click_on "Create"

    expect(current_path).to eq('/shelters/new')
    expect(Shelter.count).to eq(0)
    expect(page).to have_content("Address can't be blank")
  end
end
