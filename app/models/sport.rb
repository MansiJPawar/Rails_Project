class Sport < ApplicationRecord
  #validations
  validates :sport_name, :sport_equipement, presence: true, uniqueness: true
  
  #associations
  belongs_to :user
  has_many :announcements, dependent: :destroy
  has_many :posts
  has_many :comments
  #has_many :posts, through :comments

end
