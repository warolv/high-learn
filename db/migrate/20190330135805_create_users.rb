class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :type

      t.timestamps
    end

    add_index :users, :email
    add_index :users, :type
  end
end
