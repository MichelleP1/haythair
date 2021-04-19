class Category < ApplicationRecord
  has_many :furniture

  validates :title, presence: true
end
