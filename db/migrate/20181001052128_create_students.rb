class CreateStudents < ActiveRecord::Migration[5.2]
  def up
    create_table :students do |t|
      t.string 'std_number', null: false
      t.string 'std_name', null: false
      t.string 'std_address'
      t.string 'std_email', null:false
      t.string 'std_contact'
      t.string 'std_program', null:false
      t.string 'std_dept_name', null:false
      t.string 'std_semester', null:false
      t.timestamps
    end
  end

  def down
    drop_table :students
  end
end
