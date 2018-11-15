class Cocktail < ApplicationRecord
  validates :name, uniqueness: true, presense: true
  has_many :doses
end
