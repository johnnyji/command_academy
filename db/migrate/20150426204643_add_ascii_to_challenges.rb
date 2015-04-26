class AddAsciiToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :ascii, :text
  end
end
