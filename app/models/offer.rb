# create_table "offers", force: :cascade do |t|
#   t.string "title"
#   t.string "description"
#   t.string "coupon"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "business_id"
#   t.datetime "start_date"
#   t.datetime "end_date"
# end

class Offer < ApplicationRecord
  #Association
  belongs_to :business
end
