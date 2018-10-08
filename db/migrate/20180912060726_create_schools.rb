class CreateSchools < ActiveRecord::Migration[5.2]


  def up
    create_table :schools do |t|
      t.string "name"
      t.string "dean_name"
      t.integer "position"
      t.timestamps
    end
  end

  def down
    drop_table :schools
  end

end
