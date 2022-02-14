class Sport < ApplicationRecord
  #validations
  validates :sport_name, :sport_equipement, presence: true, uniqueness: true
  
  #associations
  belongs_to :user
  has_many :announcements
  has_many :post
  
end
