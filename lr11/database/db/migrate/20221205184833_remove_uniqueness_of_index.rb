class RemoveUniquenessOfIndex < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        remove_index :happies, :output
        add_index :happies, :output
      end
    
      dir.down do
        remove_index :happies, :output
        add_index :happies, :output, unique: true
      end
    end
  end
end
