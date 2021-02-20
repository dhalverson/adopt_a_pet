require 'rails_helper'

RSpec.describe 'as a visitor' do
  before(:each) do
    @pet_1 = create(:pet)
  end
  it 'I see a link to delete a pet on its show page' do
    visit(pet_path(@pet_1))

    expect(page).to have_link('Delete')
  end

  it 'When I click delete, the pet is deleted and I am taken back to the pets index page' do
    visit(pet_path(@pet_1))
    
    click_link('Delete')
    expect(current_path).to eq(pets_path)
    expect(page).not_to have_content(@pet_1.name)
  end
end