class AddColumnPostIdAnd < ActiveRecord::Migration[5.2]
  def change
    add_column :sports, :post_id, :integer
    add_index :sports, :post_id
    
    add_column :sports, :comment_id, :integer
    add_index :sports, :comment_id
  end
end
