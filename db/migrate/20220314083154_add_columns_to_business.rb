class AddColumnsToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :start_time, :string
    add_column :businesses, :finish_time, :string
  end
end
