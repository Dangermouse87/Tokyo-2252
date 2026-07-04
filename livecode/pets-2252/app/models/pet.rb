class Pet < ApplicationRecord
  # there has to be a name 
  validates :name, presence: true
  # validation, where species can only be from a given list 
  SPECIES = [ 'dog', 'cat', 'bird', 'hamster', 'lizard', 'crocodile']
  validates :species, inclusion: { in: SPECIES }

  # instance method to calculate the number of days ago the pet was found
  def days_ago
    (Date.today - found_on).to_i
  end
end
