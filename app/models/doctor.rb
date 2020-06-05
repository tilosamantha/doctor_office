class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  validates :last_name, :specialty, presence: true
end
