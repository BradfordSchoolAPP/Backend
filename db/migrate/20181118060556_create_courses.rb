class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :year_course
      t.string :section
      t.timestamps
    end
  end
end
