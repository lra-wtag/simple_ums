class CreateCourseEnrollments < ActiveRecord::Migration[5.2]
  def up
    create_table :course_enrollments do |t|
      t.integer :student_id, index: true, foreign_key: true
      t.integer :course_id, index: true , foreign_key: true
      t.timestamps
    end
  end

  def down
    drop_table :course_enrollments
  end
end
