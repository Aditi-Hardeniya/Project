class AddUserIdToLeaves < ActiveRecord::Migration[5.0]
  def change
    add_column :leaves, :user_id, :integer
  end
end
