class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :twitter_id, limit: 8, null: false
      t.string :name, null: false
      t.string :image, null: false

      t.timestamps null: false
    end

    add_index :users, :twitter_id, unique: true
  end
end
