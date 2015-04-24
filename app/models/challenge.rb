class Challenge < ActiveRecord::Base
  validates :instructions, :success, :fail, :answer, :level, presence: true
  validates :level, numericality: { only_integer: true }

  def self.update_levels(level)
    challenges = Challenge.where('level > ?', level)
    challenges.each do |challenge|
      challenge.level -= 1
      challenge.save
    end
  end
end