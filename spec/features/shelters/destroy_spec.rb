require 'rails_helper'

RSpec.describe 'Shelter' do
  before :each do
    @shelter1 = Shelter.create!(name: "Dan's Adoption",
                                address: "4444 Dog St.",
                                city: "Denver",
                                state: "CO",
                                zip: "80210",
                                hours_of_operation: '9:00am - 5:00pm')
    @shelter2 = Shelter.create!(name: "I Don't Like Cats",
                                address: "4200 Dogzzz St.",
                                city: "Spokane",
                                state: "WA",
                                zip: "99208",
                                hours_of_operation: '9:00am - 5:00pm')
  end

  it 'as a visitor, I can delete an existing shelter' do
    visit(shelter_path(@shelter1.id))

    expect(page).to have_content("Delete Shelter")

    click_on "Delete Shelter"

    expect(current_path).to eq(shelters_path)
    expect(Shelter.count).to eq(1)
    expect(page).to have_content(@shelter2.name)
    expect(page).to_not have_content(@shelter1.name)
  end
end
