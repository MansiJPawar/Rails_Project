class Post < ApplicationRecord
  #Association
  belongs_to :sport

  #Validations
  validates :caption, presence: true
end
