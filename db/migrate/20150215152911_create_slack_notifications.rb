class CreateSlackNotifications < ActiveRecord::Migration
  def change
    create_table :slack_notifications do |t|
      t.integer :user_id, null: false
      t.string :slack_name
      t.string :emoji
      t.string :request_url, null: false
      t.text :message, null: false

      t.timestamps null: false
    end

    add_index :slack_notifications, :user_id, unique: true
  end
end
