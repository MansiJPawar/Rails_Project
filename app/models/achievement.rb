class Achievement < ApplicationRecord
  #association
  belongs_to :user
  
  #validation
  validates :title, :detail, presence: true
end
