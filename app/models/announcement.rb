class Announcement < ApplicationRecord
  #association
  belongs_to :sport

  #Validations
  validates :subject, :notice, presence: true
end
