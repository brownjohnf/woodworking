class CreateWoods < ActiveRecord::Migration
  def change
    create_table :woods do |t|
      t.string :name
      t.string :character

      t.timestamps
    end
  end
end
