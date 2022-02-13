class Achievement < ApplicationRecord
    #validations
    validates :achievement, :captain, :file, presence: true
   
    #association
    has_one_attached :file
    belongs_to :user
end
