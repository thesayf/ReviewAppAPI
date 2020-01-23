class Tag < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings

end
