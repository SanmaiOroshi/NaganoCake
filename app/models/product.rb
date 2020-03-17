class Product < ApplicationRecord

  # boolean は enum使うとfalse不具合が起きたので、ja.ymlで変換するだけで使用しない
  # enum status: {chk_true: true, chk_false: false}

  has_many :carts, dependent: :destroy
  has_many :ordered_products, dependent: :destroy
  belongs_to :genre

  attachment :image

  validates :name, presence: true
end
