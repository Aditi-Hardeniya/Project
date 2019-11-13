class AddTLeavesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :t_leaves, :integer, default: => 0
  end
end
