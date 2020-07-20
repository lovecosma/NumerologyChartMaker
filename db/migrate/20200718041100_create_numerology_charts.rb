class CreateNumerologyCharts < ActiveRecord::Migration
  def change
    create_table :numerology_charts do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :birthdate
      t.integer :birthday_number
      t.integer :lifepath_number
      t.integer :soulurge_number
      t.integer :soulurge_challenge
      t.integer :expression_number
      t.integer :expression_challenge
      t.integer :personality_number
      t.integer :personality_challenge

      t.timestamps null: false
    end
  end
end
