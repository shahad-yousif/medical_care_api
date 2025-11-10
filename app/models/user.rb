class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  # Add custom fields if needed (e.g., name, phone)
  # validates :name, presence: true
  # validates :phone, presence: true, uniqueness: true
end
