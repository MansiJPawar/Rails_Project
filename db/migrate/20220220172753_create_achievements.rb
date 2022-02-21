class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.string :title
      t.text :detail
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
