# create_table "posts", force: :cascade do |t|
#   t.string "image"
#   t.text "caption"
#   t.bigint "sport_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "user_id"
#   t.index ["sport_id"], name: "index_posts_on_sport_id"
# end

class Post < ApplicationRecord
  #Association
  belongs_to :sport

  #Validations
  validates :caption, presence: true
end
