class Park < ApplicationRecord
  # gives access to park.dinosaurs
  has_many :dinosaurs, dependent: :destroy
end
