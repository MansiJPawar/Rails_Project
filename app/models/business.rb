# create_table "businesses", force: :cascade do |t|
#   t.string "name"
#   t.string "address"
#   t.string "logo"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "business_id"
#   t.string "start_time"
#   t.string "finish_time"
#   t.datetime "start_date"
#   t.datetime "finish_date"
# end

class Business < ApplicationRecord
  #Association 
  has_many :offers

  def self.to_csv(fields = column_name, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |business|
        csv << business.attributes.values_at(*fields)
      end
    end
  end

  def business_name
    return self.name
  end
end