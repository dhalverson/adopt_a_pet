require 'rails_helper'

RSpec.describe 'as a visitor' do
  before(:each) do
    @shelter_1 = create(:shelter)
  end
  it 'I can create a new pet for a shelter' do
    visit(shelter_path(@shelter_1))
  end
end