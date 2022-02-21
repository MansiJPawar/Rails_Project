class Sport < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :announcements
  # has_many :achievements

  # validates :name, presence: true, uniqueness: true
  # validates :equipement, presence: true
end
