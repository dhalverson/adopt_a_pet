require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I see a box to search for pets by breed on the pets index page' do
    visit(root_path)
    
    expect(page).to have_link('Search')
  end
  
  it 'I can search for a pet by breed' do
    pet_01 = create(:pet, breed: 'yorkie')
  end
end