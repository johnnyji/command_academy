class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :instructions
      t.string :console_text
      t.string :success
      t.string :fail
      t.string :answer
      t.integer :level

      t.timestamps null: false
    end
  end
end
