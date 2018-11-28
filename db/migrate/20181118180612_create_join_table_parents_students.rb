class CreateJoinTableParentsStudents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :parents, :students do |t|
      t.references :parent, foreign_key: true
      t.references :student, foreign_key: true
    end
  end
end
