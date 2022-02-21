class Sport < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :announcements
  has_many :users

  # validates :name, presence: true, uniqueness: true
  # validates :equipement, presence: true
end
