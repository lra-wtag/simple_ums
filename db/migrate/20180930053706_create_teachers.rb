class CreateTeachers < ActiveRecord::Migration[5.2]
  def up
    create_table :teachers do |t|
      t.integer 'teacher_id', null: false
      t.string 'teacher_name', null: false
      t.integer 'Contact'
      t.string 'Email', null: false
      t.string 'Designation', null: false
      t.timestamps
    end
    add_reference :teachers, :department, index: true, foreign_key: true
  end

  def down
    drop_table :teachers
  end
end
