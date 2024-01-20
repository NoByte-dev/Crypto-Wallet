class Coin < ApplicationRecord
  belongs_to :mining_type
  validates :description, :acronym, :image, presence: true
  has_one_attached :image

  def image_as_icon
    image.variant(resize_to_limit: [25,25]).processed
  end

  def image_as_thumbnail
    image.variant(resize_to_limit: [300,300]).processed
  end
end
