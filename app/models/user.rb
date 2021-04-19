class User < ApplicationRecord
  belongs_to :province, optional: true

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :address, presence: true
  validates :postal, presence: true
  validates :city, presence: true
  validates :province_id, numericality: { only_integer: true }, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
