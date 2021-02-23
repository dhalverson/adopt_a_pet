require 'rails_helper'

RSpec.describe 'Shelter' do
  before(:each) do
    @shelter1 = create(:shelter)
    @shelter2 = create(:shelter)
  end

  it 'as a visitor, I can see find a shelter by id' do

    visit(shelter_path(@shelter1.id))

    expect(page).to have_content("Shelter Details")
    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter1.address)
    expect(page).to have_content(@shelter1.city)
    expect(page).to have_content(@shelter1.state)
    expect(page).to have_content(@shelter1.zip)
    expect(page).to have_content(@shelter1.hours_of_operation)

    expect(page).to_not have_content(@shelter2.name)
    expect(page).to_not have_content(@shelter2.address)
    expect(page).to_not have_content(@shelter2.city)
    expect(page).to_not have_content(@shelter2.state)
    expect(page).to_not have_content(@shelter2.zip)
  end

  it 'displays a link to update and delete an existing shelter' do

    visit(shelter_path(@shelter1.id))

    expect(page).to have_content("Update Shelter")
    expect(page).to have_content("Delete Shelter")
  end
end
