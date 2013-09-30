class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :abbreviation
      t.integer :rooms
      t.integer :floors

      t.timestamps
    end
  end
end
