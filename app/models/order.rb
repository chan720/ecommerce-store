class Order < ApplicationRecord
  has_many :order_items
  has_many :products, through: :order_items

  def total_price
    order_items.sum { |item| item.total_price }
  end
end
