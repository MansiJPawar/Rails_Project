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

   #Validation
   #validates :title, :description, :start_date, :end_date, presence: true

end


#  ## Check if Challenge is Available for Participant
#  def available?
#   ## Set Result, By Default it is TRUE
#   result = true
#   result_array = []

#   # Loop Through the Filters
#   self.challenge_filters.each do |filter|
#     result_array.push(filter.available? Participant.current)
#   end

#   ## Check If We need to Include ALL/ANY Filter
#   if self.filter_type == 'all_filters'
#     result = !result_array.include?(false)
#   else
#     result = result_array.include?(true)
#   end

#   result
# end


# ## Challenge Filter
# def self.challenge_side_bar_filter(filters)
#   query = 'id IS NOT NULL'
#   tags_query = ''
#   status = []
#   platform_type = []
#   challenge_type = []
#   reward_type = []

#   filters.each do |key, value|
#     if key == 'status' && value.present?
#       status_query = ''
#       value.each_with_index do |val, index|
#         keyword = ' OR'
#         if index == 0
#           keyword = 'AND'
#         end

#         if val == 'draft'
#           status_query = " #{keyword} (is_approved = false)"
#         elsif val == 'active'
#           status_query = status_query +
#               " #{keyword} is_approved = true AND start <= timezone(timezone,now()) AND finish >= timezone(timezone,now())"

#           ## Back up
#           # status_query = status_query + " #{keyword} (is_approved = true AND start <= convert_tz('#{current_utc_time}', 'UTC', timezone) AND finish >= convert_tz('#{current_utc_time}', 'UTC', timezone))"
#           # status_query = status_query + " #{keyword} (is_approved = true AND start <= convert_tz('#{current_utc_time}', 'UTC', timezone) AND finish >= convert_tz('#{current_utc_time}', 'UTC', timezone))"
#         elsif val == 'scheduled'
#           status_query = status_query +
#               " #{keyword} is_approved = true AND start > timezone(timezone,now())"

#           ## Back up
#           # # status_query = status_query + " #{keyword} (is_approved = true AND start > convert_tz('#{current_utc_time}', 'UTC', timezone))"
#           # #unix_timestamp(convert_tz(now(), 'UTC', offers.timezone))
#           # status_query = " #{keyword} timezone(offers.timezone, offers.start) > :schedule"
#           # ended_offers = self.select{|challenge| challenge.finish.in_time_zone(challenge.timezone) < Time.now.in_time_zone(challenge.timezone)}
#           # scheduled_keyword = Time.now.in_time_zone(self.timezone).to_i
#         elsif val == 'ended'
#           status_query = status_query +
#               " #{keyword} is_approved = true AND finish < timezone(timezone,now())"

#           ## Back up
#           # status_query = status_query + " #{keyword} (is_approved = true AND finish > convert_tz('#{current_utc_time}', 'UTC', timezone))"
#           # status_query = " #{keyword} convert_tz(offers.finish, 'UTC') < :ended_keyword"
#           # ended_keyword = Time.now.in_time_zone(self.timezone).to_i
#         end
#       end

#       query = query + status_query
#     elsif key == 'challenge_type' && value.present?
#       value.each do |c_type|
#         challenge_type << Challenge::categories[c_type]
#       end
#       query = query + ' AND category IN (:challenge_type)'
#     elsif key == 'platform_type' && value.present?
#       value.each do |c_type|
#         platform_type << Challenge::parameters[c_type]
#       end
#       query = query + ' AND parameters IN (:platform_type)'
#     elsif key == 'reward_type' && value.present?
#       value.each do |c_type|
#         reward_type << Challenge::reward_types[c_type]
#       end
#       query = query + ' AND parameters IN (:reward_type)'
#     elsif key == 'tags' && value.present?
#       value.each do |tag|
#         tags_query = tags_query + " AND EXISTS (SELECT * FROM taggings WHERE taggings.taggable_id = offers.id AND taggings.taggable_type = 'Challenge'" +
#             " AND taggings.tag_id IN (SELECT tags.id FROM tags WHERE (LOWER(tags.name) ILIKE '#{tag}' ESCAPE '!')))"
#       end

#       query = query + tags_query
#     end
#   end
#   offers = self.where(query, is_approved: status, challenge_type: challenge_type.flatten,
#                           platform_type: platform_type.flatten, reward_type: reward_type.flatten)
#   return offers
# end
