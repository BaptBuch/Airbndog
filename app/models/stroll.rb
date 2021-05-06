class Stroll < ApplicationRecord
  belongs_to :city
  belongs_to :dogsitters
  belongs_to :dogs
end
