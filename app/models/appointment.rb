class Appointment < ApplicationRecord
  belongs_to :doctor, dependent: :destroy
  belongs_to :patient, dependent: :destroy

  validates :month, :day, presence: true

  def date
    "#{self.day}/#{self.month}"
  end
end
