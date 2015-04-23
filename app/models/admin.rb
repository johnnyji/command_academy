class Admin < ActiveRecord::Base
  validates :username, presence: true, length: { minimum: 3}
  validates :password, presence: true
end