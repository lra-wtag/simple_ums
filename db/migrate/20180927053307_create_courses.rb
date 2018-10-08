class CreateCourses < ActiveRecord::Migration[5.2]
  def up
    create_table :courses do |t|
      t.integer 'position', null: false
      t.string 'course_ID', null: false
      t.string 'course_name', null: false
      t.integer 'credits', null: false
      t.timestamps
    end
  end

  def down
    drop_table :courses
  end
end
