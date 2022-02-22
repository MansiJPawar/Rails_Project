class SportSerializer < ActiveModel::Serializer
  #params 
  attributes :id, :name,:equipement 
  #association
  has_many :posts
  has_many :announcements
end
