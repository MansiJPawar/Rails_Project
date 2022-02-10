class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.string :player_name
      t.string :sport_name
      t.text :achievement
      t.boolean :captain
      t.boolean :gender

      t.timestamps
    end
  end
end
