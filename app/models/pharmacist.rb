class Pharmacist < ApplicationRecord
  belongs_to :pharmacy
  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
