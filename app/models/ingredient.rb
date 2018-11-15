class Ingredient < ApplicationRecord
  validates :name, uniqueness: true, presense: true
  has_many :doses
end
