class Coin < ApplicationRecord
  belongs_to :mining_type
  validates :description, :acronym, :image, presence: true
  has_one_attached :image 
end
