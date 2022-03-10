# create_table "announcements", force: :cascade do |t|
#   t.string "subject"
#   t.text "notice"
#   t.bigint "sport_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["sport_id"], name: "index_announcements_on_sport_id"
# end

class Announcement < ApplicationRecord
  #association
  belongs_to :sport

  #Validations
  validates :subject, :notice, presence: true
end
