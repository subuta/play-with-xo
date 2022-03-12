class AddTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :label, null: false

      t.timestamps
    end

    add_index :tags, :label, unique: true

    create_table :tag_user do |t|
      t.string :tag_label, null: false
      t.integer :user_id
      t.integer :tag_likes

      t.timestamps
    end

    add_foreign_key :tag_user, :tags, column: :tag_label, primary_key: :label
    add_foreign_key :tag_user, :users, column: :user_id

    add_index :tag_user, [:tag_label, :user_id], unique: true
  end
end
