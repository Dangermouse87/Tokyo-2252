class Dinosaur < ApplicationRecord
  # gives access to dinosaur.park
  belongs_to :park

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :image_url, presence: true
end
