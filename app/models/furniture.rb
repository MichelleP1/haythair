class Furniture < ApplicationRecord
  belongs_to :category
  # validates :name, presence: true
  has_one_attached :image
end

# def self.filter(filter)
#   if filter
#     f = self.where('LOWER(furniture.title) LIKE ?', "sed%")
#     if f
#       f = self.where('LOWER(furniture.title) LIKE ?', "sed")
#     else
#       Furniture.all
#     end
#   else
#     Furniture.all
#   end
# end