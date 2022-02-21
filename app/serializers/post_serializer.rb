class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption

  belongs_to :sport
end
