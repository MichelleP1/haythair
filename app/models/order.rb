class Order < ApplicationRecord
  has_many :order_items

  validates :payment_id, presence: true
  validates :payment_paid, presence: true
  validates :pst, :numericality => true, presence: true
  validates :hst, :numericality => true, presence: true
  validates :gst, :numericality => true, presence: true
  validates :user_id, numericality: { only_integer: true }, presence: true
end
