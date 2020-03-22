class Genre < ApplicationRecord
  has_many :products
  validates :genre ,presence: true
end
