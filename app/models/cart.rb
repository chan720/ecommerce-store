class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :admin_users
  has_many :cart_items, dependent: :destroy
  def total_price
    cart_items.sum(&:total_price)
  end
end
