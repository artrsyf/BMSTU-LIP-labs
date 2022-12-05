class ChangeHappiesColumnInput < ActiveRecord::Migration[7.0]
  def change
    change_table :happies do |t|
      t.change :input, :string
    end
  end
end
