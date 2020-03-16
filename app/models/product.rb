class Product < ApplicationRecord

  enum status: {"販売中": true, "販売停止中": false}
  has_many :carts, dependent: :destroy
  has_many :ordered_products, dependent: :destroy
  belongs_to :genre

  attachment :image
end
