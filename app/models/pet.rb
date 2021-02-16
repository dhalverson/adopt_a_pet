class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :sex, presence: true
  validates :type, presence: true
  validates :adopted, inclusion: { in: [ true, false ] }
  validates :description, presence: true
  # validates :images, presence: true

  belongs_to :shelter
end
