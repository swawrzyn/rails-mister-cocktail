class Review < ApplicationRecord
  belongs_to :cocktail

  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: true, allow_nil: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
