class CreateSports < ActiveRecord::Migration[5.2]
  def change
    create_table :sports do |t|
      t.string :name
      t.text :equipement

      t.timestamps
    end
  end
end
