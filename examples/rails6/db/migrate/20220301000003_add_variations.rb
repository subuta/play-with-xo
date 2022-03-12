class AddVariations < ActiveRecord::Migration[7.0]
  def change
    create_enum :variations_enum, ['one', 'two', 'three', 'four']

    create_table :variations do |t|
      t.integer :c_integer
      t.bigint :c_bigint
      t.text :c_text
      t.string :c_string
      t.float :c_float
      t.decimal :c_decimal
      t.decimal :c_decimal_params, :precision => 10, :scale => 2
      t.boolean :c_boolean
      t.date :c_date
      t.datetime :c_datetime
      t.time :c_time
      t.timestamp :c_timestamp
      t.binary :c_binary
      t.enum :c_enu, enum_type: :variations_enum, null: true
      t.json :c_json_array
      t.json :c_json_object

      t.timestamps
    end
  end
end
