class CreateJoinTableCoursesParents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :courses, :parents do |t|
      t.references :course, foreign_key: true
      t.references :parent, foreign_key: true
    end
  end
end
