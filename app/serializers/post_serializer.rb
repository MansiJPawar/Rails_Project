class PostSerializer < ActiveModel::Serializer
  #params 
  attributes :id, :caption
  #association
  belongs_to :sport
end
