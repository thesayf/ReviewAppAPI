class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :image
  has_many :posts
  has_many :comments

end
