class CreateHappies < ActiveRecord::Migration[7.0]
  def change
    create_table :happies do |t|
      t.integer :input, null: false
      t.string :output, null: false

      t.timestamps
    end
    add_index :happies, :output, unique: true
  end
end
