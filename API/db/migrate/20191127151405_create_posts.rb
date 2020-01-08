class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :longitude
      t.string :latitude
      t.string :address

      t.timestamps
    end
  end
end
