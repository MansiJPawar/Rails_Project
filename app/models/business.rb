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

  #limit audit
  #audited max_audits: 3

  #call to require comments for all audits.
  #audited :comment_required => true

  # update an audit only if audit_comment is present set to false
  #audited :update_with_comment_only => false
  
  #Audit
  audited

  #More Audit Options
  # Single field
  #audited only: :name

  # Multiple fields
  # audited only: [:name, :address]

  # All except certain fields
  #audited except: :address


  # Single field, only audit Update and Destroy (not Create)
  # audited only: :name, on: [:update, :destroy]

  #Export CSV file for Business DataTable
  def self.to_csv(fields = column_name, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |business|
        csv << business.attributes.values_at(*fields)
      end
    end
  end
end