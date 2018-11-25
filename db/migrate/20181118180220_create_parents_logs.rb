class CreateParentsLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :parents_logs do |t|
      t.text :detail
      t.references :parent, foreign_key: true
      t.timestamps
    end
  end
end
