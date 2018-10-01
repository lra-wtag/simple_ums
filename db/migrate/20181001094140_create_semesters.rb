class CreateSemesters < ActiveRecord::Migration[5.2]
  def up
    create_table :semesters do |t|
      t.string :sem_ID, null:false
      t.string :sem_name, null:false
      t.date :sem_start
     # t.belongs_to :department, index: true
     # t.belongs_to :student, index: true
      t.timestamps
    end
  end

  def down
    drop_table :semesters
  end
end
