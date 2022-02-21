class AddSportIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sport_id, :integer
    add_column :users, :phone_number, :integer
  end
end
