class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :follwer_id
      t.integer :follwed_id

      t.timestamps
    end

    add_index :relationships, :follwer_id
    add_index :relationships, :follwed_id
    add_index :relationships, [:follwer_id, :follwed_id], unique: true
  end
end
