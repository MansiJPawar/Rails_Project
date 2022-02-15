class Announcement < ApplicationRecord
  #validations
  validates :announcement_title, :content, presence: true

  #belongs_to :user
  belongs_to :sport 

end
