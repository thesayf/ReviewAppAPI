class Tag < ApplicationRecord
  include Searchable

  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings


  after_save :posts_re_index
  after_destroy :delete_post_index

  private

  def posts_re_index
    posts.each do |post|
      post.re_index
    end
  end

  def delete_posts_index
    posts.each do |post|
      post.re_index
    end
  end

end
