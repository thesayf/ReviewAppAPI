class Tagging < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  searchkick
  belongs_to :tag
  belongs_to :post
end
