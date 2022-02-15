class Sport < ApplicationRecord
  #validations
  validates :sport_name, :sport_equipement, presence: true, uniqueness: true
  
  #associations
  belongs_to :user
  has_many :announcements, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  #has_many :posts, through :comments

end
