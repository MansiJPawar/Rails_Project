class AddColumnSportIdToPostsTags < ActiveRecord::Migration[5.2]
  def change
    add_column :posts_tags, :sport_id, :integer
    add_index :posts_tags, :sport_id
  end
end
