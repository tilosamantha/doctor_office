class Appointment < ApplicationRecord
  belongs_to :doctors, dependent: :destroy
  belongs_to :patients, dependent: :destroy

  validates :month, :day, presence: true

  def date
    "#{self.day}/#{self.month}"
  end
end
