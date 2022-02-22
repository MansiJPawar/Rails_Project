class AchievementSerializer < ActiveModel::Serializer
  #params 
  attributes :id,:title, :detail
  #association
  belongs_to :user
end
