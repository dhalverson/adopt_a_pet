require 'rails_helper'

RSpec.describe 'Shelter' do
  it 'as a visitor, I can see find a shelter by id' do
    shelter1 = create(:shelter)
    shelter2 = create(:shelter)

    visit "/shelters/#{shelter1.id}"

    expect(page).to have_content("Shelter Details")
    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter1.address)
    expect(page).to have_content(shelter1.city)
    expect(page).to have_content(shelter1.state)
    expect(page).to have_content(shelter1.zip)
    expect(page).to have_content(shelter1.open)
  end
end
