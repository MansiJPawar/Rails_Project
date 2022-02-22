class Post < ApplicationRecord
  #association
  belongs_to :sport

  #Validations
  validates :caption, presence: true
end
