class ChangeLongitudeToFloatInPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :longitude, :float
    change_column :posts, :latitude, :float
  end
end
