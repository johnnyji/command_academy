class Admin < ActiveRecord::Base
  validates :username, presence: true, length: { minimum: 3}
  validates :password, presence: true
  validate :only_one_admin

  def only_one_admin
    if Admin.count > 1
      errors.add :base, 'Sorry, an admin already exists.'
      false
    end
  end

end