class Wine < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  validates :name, presence: true
  validates :type, presence: true
  validates :price, presence: true
end
