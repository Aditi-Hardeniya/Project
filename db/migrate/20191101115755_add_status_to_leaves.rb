class AddStatusToLeaves < ActiveRecord::Migration[5.0]
  def change
    add_column :leaves, :status, :string
  end
end
