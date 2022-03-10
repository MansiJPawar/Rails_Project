class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.string :coupon

      t.timestamps
    end
  end
end
