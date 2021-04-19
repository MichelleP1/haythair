class OrderItem < ApplicationRecord
  belongs_to :furniture
  belongs_to :order

  validates :quantity, numericality: { only_integer: true }, presence: true
  validates :price, :numericality => true, presence: true
  validates :furniture_id, numericality: { only_integer: true }, presence: true
  validates :order_id, numericality: { only_integer: true }, presence: true
end
