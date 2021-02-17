require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :sex }
    it { should validate_presence_of :breed }
    it { should validate_presence_of :adopted }
    it { should validate_presence_of :description }
    it { should validate_presence_of :species }
    # it { should validate_presence_of :images }
  end

  describe 'relationships' do
    it { should belong_to :shelter }
  end
end
