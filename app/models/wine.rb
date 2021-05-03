class Wine < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true
  validates :wine_type, presence: true
  validates :price, presence: true
  validates :vineyard, presence: true
  validates :region, presence: true
  has_one_attached :photo
end

