class AddIndexToDeptTable < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :school_id, :integer
    add_index :departments, :school_id
  end
end
