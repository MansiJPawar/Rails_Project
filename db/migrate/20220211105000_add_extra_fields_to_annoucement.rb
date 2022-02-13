class AddExtraFieldsToAnnoucement < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :sport_name, :string
  end
end
