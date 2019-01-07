class CreateJoinTableCourseTeacher < ActiveRecord::Migration[5.2]
  def change
    create_join_table :courses, :teachers do |t|
      t.references :course, foreign_key: true
      t.references :teacher, foreign_key: true
    end
  end
end
