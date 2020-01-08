class ChangeLatitudeToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :latitude, :integer
  end
end
