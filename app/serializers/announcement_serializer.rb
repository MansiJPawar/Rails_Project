class AnnouncementSerializer < ActiveModel::Serializer
  #params 
  attributes :id,:subject, :notice
  #association
  belongs_to :sport
end
