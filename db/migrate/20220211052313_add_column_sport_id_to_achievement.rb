class AddColumnSportIdToAchievement < ActiveRecord::Migration[5.2]
  def change
    add_column :achievements, :sport_id, :integer
    add_index :achievements, :sport_id
  end
end
