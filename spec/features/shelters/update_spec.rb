require 'rails_helper'

RSpec.describe 'Shelter' do
  before :each do
    @shelter1 = Shelter.create!(name: "Dan's Adoption",
                                address: "4444 Dog St.",
                                city: "Denver",
                                state: "CO",
                                zip: "80210",
                                hours_of_operation: '9:00am - 5:00pm')
  end

  it 'as a visitor, I can update an existing shelter' do

    visit(edit_shelter_path(@shelter1.id))

    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Zip")
    expect(page).to have_content("Hours of operation")

    fill_in "Name", with: "Bob's Adoption"

    click_button('Update')

    expect(current_path).to eq(shelter_path(@shelter1.id))
    expect(page).to have_content("Bob's Adoption")
  end
end
