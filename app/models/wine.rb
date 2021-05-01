class Wine < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true
  validates :wine_type, presence: true
  validates :price, presence: true
end

