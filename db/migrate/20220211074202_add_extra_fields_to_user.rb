class AddExtraFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :phone_number, :bigint
    add_column :users, :gender, :boolean
    
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
