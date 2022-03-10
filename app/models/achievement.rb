# create_table "achievements", force: :cascade do |t|
#   t.string "title"
#   t.text "detail"
#   t.bigint "sport_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "user_id"
#   t.index ["sport_id"], name: "index_achievements_on_sport_id"
# end

class Achievement < ApplicationRecord
  #association
  belongs_to :user
  
  #validation
  validates :title, :detail, presence: true
end
