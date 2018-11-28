class CreateJoinTableDevicesParents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :devices, :parents do |t|
      t.references :device, foreign_key: true
      t.references :parent, foreign_key: true
    end
  end
end
