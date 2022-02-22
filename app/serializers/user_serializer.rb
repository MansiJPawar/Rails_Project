class UserSerializer < ActiveModel::Serializer
  #params 
  attributes :id, :email, :name
  #association
  has_many :achievements
end
