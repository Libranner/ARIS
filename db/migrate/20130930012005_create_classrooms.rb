class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.time :available_from
      t.time :available_until
      t.integer :sits
      t.belongs_to :building

      t.timestamps
    end
    add_index :classrooms, :building_id
  end
end
