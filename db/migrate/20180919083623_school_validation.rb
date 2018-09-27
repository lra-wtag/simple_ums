class SchoolValidation < ActiveRecord::Migration[5.2]
  def change
    change_column_null :schools, :name, false
    change_column_null :schools, :dean_name, false
    change_column_null :schools, :position, false
  end
end
