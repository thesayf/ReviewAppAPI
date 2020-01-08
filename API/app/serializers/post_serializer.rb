class PostSerializer < ActiveModel::Serializer
  attributes :created_at, :title, :description, :video, :id, :latitude, :longitude, :address, :user, :tags
  has_many :comments
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  
end
