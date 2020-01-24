class Tagging < ApplicationRecord
  include Searchable

  belongs_to :tag
  belongs_to :post

  after_save :post_index
  after_destroy :delete_post_index

  private

  def post_index
    post.re_index
  end

  def delete_post_index
    post.delete_index
  end
end
