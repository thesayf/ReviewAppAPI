class TagSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user
  has_one :post
end
