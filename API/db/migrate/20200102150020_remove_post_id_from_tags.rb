class RemovePostIdFromTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :tags, :post_id, null: false, foreign_key: true
  end
end
