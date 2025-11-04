class Doctor < ApplicationRecord
  validates :name, :specialty, :location, presence: true
  validates :email, presence: true, uniqueness: true
  validates :experience, numericality: { only_integer: true, greater_than: 0 }
end
