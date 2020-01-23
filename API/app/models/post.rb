class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :user
  has_many :comments
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  mapping do
    byebug
    indexes :title
    indexes :description
    indexes :address
    indexes :video
    indexes :longitude, type: 'integer'
    indexes :latitude, type: 'integer'
    indexes :user_id, type: 'integer'
    indexes "tags", type: "nested" do
            indexes "name", type: "text"
          end 
  end


  # indexes :tags, type: 'nested' do
  #   indexes :name
  # end

  # def self.search_posts_by_tags(query)
  #   self.search({
  #     query: {
  #       bool: {
  #         must: [
  #         {
  #           multi_match: {
  #             query: query,
  #             fields: [:author, :title, :body, :tags]
  #           }
  #         },
  #         {
  #           match: {
  #             published: true
  #           }
  #         }]
  #       }
  #     }
  #   })
  # end

   # settings do
  #   mappings do
  #     indexes :title, type: :text
  #     indexes :description, type: :text, analyzer: :english
  #     indexes :longitude, type: :integer
  #     indexes :latitiude, type: :integer
  #     indexes :address, type: :text, analyzer: :english
  #     indexes :user_id, type: :integer
  #     indexes :video, type: :text, analyzer: :english
  #     indexes :tags, type: :nested do
  #       indexes :name, type: :text
  #     end 
  #   end 

  # end

  def all_tags=(names)
    self.tags = names.map do |name|
        Tag.where(name: name).first_or_create!
  end

  end


  
end