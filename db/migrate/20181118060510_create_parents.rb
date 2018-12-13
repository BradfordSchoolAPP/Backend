class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|
      t.string :email
      t.string :password
      t.string :name
      t.integer :phone_number
      t.boolean :recv_notifications
      t.boolean :active_user
      t.timestamps
    end
  end
end
