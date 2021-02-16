class Shelter < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { is: 5 }
  validates :open, :inclusion => {:in => [true, false]}

  has_many :pets
end
