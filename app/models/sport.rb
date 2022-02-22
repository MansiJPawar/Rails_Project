class Sport < ApplicationRecord
  #associations
  has_many :posts, dependent: :destroy
  has_many :announcements
  has_many :users

  #validation
  validates :name, presence: true, uniqueness: true
  validates :equipement, presence: true
end
