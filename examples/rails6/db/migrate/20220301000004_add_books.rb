class AddBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author_name
      t.integer :view_count

      t.timestamps
    end

    add_foreign_key :books, :users, column: :author_name, primary_key: :name

    add_index :books, [:name, :author_name], unique: true

    create_table :campaign_books do |t|
          t.integer :book_id, null: false
          t.integer :price
          t.datetime :starts_at
          t.datetime :ends_at

          t.timestamps
        end

        add_index :campaign_books, [:book_id, :price], unique: true
  end
end
