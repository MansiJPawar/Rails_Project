class AddStartdateToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :start_date, :datetime
    add_column :businesses, :finish_date, :datetime
  end
end
