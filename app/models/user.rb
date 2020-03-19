class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy

  def user_total_price
    sum = 0
    total_record = self.carts
    total_record.each do |record|
      sum += (record.price * 1.1).floor * record.units
    end
    return sum
  end

  def total_price_commission
    self.user_total_price + 800
  end

end
