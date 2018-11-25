class CreateJoinTableParentsUserTypes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :parents, :user_types do |t|
      t.references :parent, foreign_key: true
      t.references :user_type, foreign_key: true
    end
  end
end
