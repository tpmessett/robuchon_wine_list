class Wine < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true
  validates :wine_type, presence: true
  validates :price, presence: true
  validates :vineyard, presence: true
  validates :region, presence: true
  has_one_attached :photo
  has_one_attached :wine_region_map
  include PgSearch::Model
  pg_search_scope :search_by_name_vineyard_region_description,
    against: [ :name, :description, :region, :vineyard, :product_information, :food_pairings, :tasting_notes ],
    using: {
      tsearch: { prefix: true }
    }
end
