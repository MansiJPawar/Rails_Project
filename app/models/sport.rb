class Sport < ApplicationRecord
  #validations
  validates :sport_name, :sport_equipement, presence: true
  
  #associations
  belongs_to :user

end
