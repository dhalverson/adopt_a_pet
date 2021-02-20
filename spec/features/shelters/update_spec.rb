require 'rails_helper'

RSpec.describe 'Shelter' do
  before :each do
    @shelter1 = Shelter.create!(name: "Dan's Adoption",
                                address: "4444 Dog St.",
                                city: "Denver",
                                state: "CO",
                                zip: "80210",
                                open: true)
  end

  it 'as a visitor, I can update an existing shelter' do
    visit "/shelters/#{@shelter1.id}/edit"

    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip")
    expect(page).to have_content("Open")

    fill_in "Name", with: "Bob's Adoption"

    click_button('Update')

    expect(current_path).to eq("/shelters/#{@shelter1.id}")
    expect(page).to have_content("Bob's Adoption")
  end
end
