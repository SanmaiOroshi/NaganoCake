class Product < ApplicationRecord
  has_many :carts, dependent: :destroy
  has_many :ordered_products, :dependent :destroy
  belongs_to :genre
end