class CreateWorkPlaces < ActiveRecord::Migration
  def change
    create_table :work_places do |t|
      t.integer :user_id, null: false
      t.string :destination, null: false
      t.string :limit, null: false

      t.timestamps null: false
    end

    add_index :work_places, :user_id, unique: true
  end
end
