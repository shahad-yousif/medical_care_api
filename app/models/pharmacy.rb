class Pharmacy < ApplicationRecord
  has_many :pharmacists
  validates :name, :location, presence: true
  validates :email, presence: true, uniqueness: true
end
