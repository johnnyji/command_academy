class Challenge < ActiveRecord::Base
  validates :instructions, :success, :fail, :answer, :level, presence: true
  validates :level, numericality: { only_integer: true }
end