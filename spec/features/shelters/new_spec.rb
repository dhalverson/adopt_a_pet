require 'rails_helper'

RSpec.describe 'Shelter' do
  it 'as a visitor, I can create a new shelter' do

    visit '/shelters'

    expect(page).to have_link("New Shelter")
    click_link "New Shelter"

    expect(current_path).to eq('/shelters/new')
  end
end
