class AnnouncementSerializer < ActiveModel::Serializer
  attributes :id,:subject, :notice

  belongs_to :sport
end
