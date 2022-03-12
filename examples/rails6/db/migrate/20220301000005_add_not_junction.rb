class AddNotJunction < ActiveRecord::Migration[7.0]
  def change
    create_table :purchased_books do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :receipt_name

      t.timestamps
    end

    add_foreign_key :purchased_books, :books, column: :book_id
    add_foreign_key :purchased_books, :users, column: :user_id
  end
end
