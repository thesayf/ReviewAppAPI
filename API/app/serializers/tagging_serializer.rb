class TaggingSerializer < ActiveModel::Serializer
  attributes :id, :post
  has_one :tag
end
