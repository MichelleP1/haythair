class Category < ApplicationRecord
  has_many :furniture

  validates :title, presence: true

  def name_for_select
    title.titleize
  end
end
