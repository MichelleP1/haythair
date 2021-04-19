class Furniture < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  validates :title, presence: true
  validates :price, :numericality => true, presence: true
  validates :description, presence: true
  validates :weight, numericality: { only_integer: true }, presence: true
  validates :stock, numericality: { only_integer: true }, presence: true
  validates :category_id, numericality: { only_integer: true }, presence: true
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