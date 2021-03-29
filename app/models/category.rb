class Category < ApplicationRecord
  has_many :furniture
  # validates :name, :age, :number_of_legs, :top_speed, presence: true
end
