class DropAdmins < ActiveRecord::Migration
  def down
    create_table(:admins) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      t.timestamps
    end

    add_index :admins, :email, :unique => true
  end
  
  def up
    drop_table :admins
  end
end
