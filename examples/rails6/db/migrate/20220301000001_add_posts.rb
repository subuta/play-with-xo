class AddPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.integer :author_id
      t.json :tags

      t.timestamps
    end

    add_foreign_key :posts, :users, column: :author_id

    add_index :posts, [:title, :author_id], unique: true
  end
end
