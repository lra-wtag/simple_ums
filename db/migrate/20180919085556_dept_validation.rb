class DeptValidation < ActiveRecord::Migration[5.2]
  def change
    change_column_null :departments, :name, false
    change_column_null :departments, :head_name, false
    change_column_null :departments, :position, false
    change_column_null :departments, :capacity, false
  end
end

