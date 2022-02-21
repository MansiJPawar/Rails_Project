class SportSerializer < ActiveModel::Serializer
  attributes :id, :name,:equipement 

  has_many :posts
  has_many :announcements
end
