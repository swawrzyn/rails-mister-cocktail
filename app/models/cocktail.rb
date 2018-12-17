class Cocktail < ApplicationRecord
  before_validation { self.name = name.downcase unless name.nil? }
  validates :name, uniqueness: true, presence: true, allow_nil: false, allow_blank: false, length: {maximum: 25}
  validates :photo, presence: true, allow_nil: false, allow_blank: false
  validates :description, presence: true, allow_nil: false, allow_blank: false, length: {maximum: 75}
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :doses
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :global_search,
    against: [ :name, :description ],
    associated_against: {
      ingredients: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def avg_rating
    average = 0
    return average if reviews.count.zero?

    average.to_f
    reviews.each { |review| average += review.rating }
    (average / reviews.count).floor
  end
end
