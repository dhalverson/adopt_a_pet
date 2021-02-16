require 'rails_helper'

RSpec.describe 'Shelter' do
  it 'as a visitor, I can see all existing shelters' do
    shelters = create_list(:shelter, 2)

    visit '/shelters'

    expect(page).to have_content("All Shelters")
    shelters.each do |shelter|
      expect(page).to have_content(shelter.name)
      expect(page).to have_content(shelter.address)
      expect(page).to have_content(shelter.city)
      expect(page).to have_content(shelter.state)
      expect(page).to have_content(shelter.zip)
      expect(page).to have_content(shelter.open)
    end
  end
end


# [ ] done
#
# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
