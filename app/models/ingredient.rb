class Ingredient < ApplicationRecord
  before_validation { self.name = name.downcase unless name.nil? }
  validates :name, uniqueness: true, presence: true, allow_blank: false, allow_nil: false
  has_many :doses
end
