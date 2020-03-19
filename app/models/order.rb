class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_products, dependent: :destroy

  enum payment_method: {
    card: 1,
    transfar: 2
  }

  enum status: {
    waiting_payment: 1,
    confirm: 2,
    making: 3,
    waiting_shipping: 4,
    already_shipping: 5
  }

end
