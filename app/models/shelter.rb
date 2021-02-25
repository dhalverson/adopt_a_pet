class Shelter < ApplicationRecord
  has_one_attached :image
  
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { is: 5 }
  validates :hours_of_operation, presence: true

  has_many :pets, dependent: :destroy
end
