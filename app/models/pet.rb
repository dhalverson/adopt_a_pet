class Pet < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :sex, presence: true
  validates :breed, presence: true
  validates :adopted, inclusion: { in: [ true, false ] }
  validates :description, presence: true
  validates :species, presence: true
  # validates :images, presence: true

  belongs_to :shelter
end
