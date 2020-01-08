class ChangeLongitudeToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :longitude, :integer
  end
end
