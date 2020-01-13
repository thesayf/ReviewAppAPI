class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :posts
  has_many :posts, through: :taggings
end
