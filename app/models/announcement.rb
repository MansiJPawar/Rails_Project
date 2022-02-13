class Announcement < ApplicationRecord
  #validations
  validates :announcement_title, :content, :sport_name, presence: true

  #belongs_to :user
  belongs_to :sport

end
