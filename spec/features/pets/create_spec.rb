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

  it ''
end
 