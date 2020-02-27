class Post < ApplicationRecord
  include Searchable

  belongs_to :user
  has_many :comments
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings


  after_save    :re_index
  after_destroy :delete_index

  mappings dynamic: 'false' do
    indexes :title, type: :keyword
    indexes :description, type: :keyword
    indexes :address, type: :keyword
    indexes :video, type: :keyword
    indexes :longitude, type: :integer
    indexes :latitude, type: :integer
    indexes :user_id, type: :integer

    indexes :taggings, type: :nested
    indexes :tags, type: :nested do
      indexes :name, type: :text, analyzer: :english
    end
  end

  def as_indexed_json(options = {})
    self.as_json(
      options.merge(
        only: [:title, :description, :address, :video, :longitude, :latitude, :user_id],
        include: { tags: { only: [:name] },
      }
      )
    )
  end

  # params type tag: string
  def self.search_by_tags(tag, query = ::Query::Posts::ByTags.new)
    self.search(query.call(tag)).records.to_a
  end

  # params type tag: string, long: integer, lat; integer
  def self.search_by_tags_and_location(tag:, long:, lat:, query: ::Query::Posts::ByTagsAndLocation.new)
    self.search(query.call(tag, long, lat)).records.to_a
  end

  def all_tags=(names)
    self.tags = names.map do |name|
      Tag.where(name: name).first_or_create!
    end
  end
end