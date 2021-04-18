class OrderItem < ApplicationRecord
  belongs_to :furniture
  belongs_to :order
end
