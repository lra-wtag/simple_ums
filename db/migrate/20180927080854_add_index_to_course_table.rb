class AddIndexToCourseTable < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :department, index: true, foreign_key: true
  end
end
