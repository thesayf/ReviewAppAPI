class DeleteAddressFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :address
  end
end
