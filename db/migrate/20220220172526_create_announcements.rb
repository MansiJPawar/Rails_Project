class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :subject
      t.text :notice
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
