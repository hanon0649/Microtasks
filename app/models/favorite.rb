class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :microtask
  
  # has_many :favorelationships
end
