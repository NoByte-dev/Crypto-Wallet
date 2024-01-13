class Coin < ApplicationRecord
  belongs_to :mining_type
  validates :description, :acronym, presence: true
end
