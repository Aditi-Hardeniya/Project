class CreateLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :leaves do |t|
      t.string :ltype
      t.datetime :datefrom
      t.datetime :dateto
      t.integer :days
      t.text :reason
      t.integer :tleaves
      # t.integer :user_id

      t.timestamps
    end
  end
end
