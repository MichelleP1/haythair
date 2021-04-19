class Province < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :code, presence: true
  validates :pst, :numericality => true, presence: true
  validates :hst, :numericality => true, presence: true
  validates :gst, :numericality => true, presence: true
end
