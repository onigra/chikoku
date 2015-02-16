ActiveRecord::Schema.define(version: 20150216123629) do

  create_table "slack_notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",     limit: 4,     null: false
    t.string   "slack_name",  limit: 255
    t.string   "emoji",       limit: 255
    t.string   "request_url", limit: 255,   null: false
    t.text     "message",     limit: 65535, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "slack_notifications", ["user_id"], name: "index_slack_notifications_on_user_id", unique: true, using: :btree

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "twitter_id", limit: 4,   null: false
    t.string   "name",       limit: 255, null: false
    t.string   "image",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["twitter_id"], name: "index_users_on_twitter_id", unique: true, using: :btree

  create_table "work_places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id",     limit: 4,   null: false
    t.string   "destination", limit: 255, null: false
    t.string   "limit",       limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "work_places", ["user_id"], name: "index_work_places_on_user_id", unique: true, using: :btree

end
