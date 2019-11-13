class RemoveTleavesFromLeaves < ActiveRecord::Migration[5.0]
  def change
    remove_column :leaves, :tleaves, :integer
  end
end
