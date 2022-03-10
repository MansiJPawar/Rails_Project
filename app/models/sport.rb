# create_table "sports", force: :cascade do |t|
#   t.string "name"
#   t.text "equipement"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

class Sport < ApplicationRecord
  #associations
  has_many :posts, dependent: :destroy
  has_many :announcements
  has_many :users

  #validation
  validates :name, presence: true, uniqueness: true
  validates :equipement, presence: true
end
