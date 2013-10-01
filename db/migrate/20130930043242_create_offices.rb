class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name
      t.text :description
      t.time :open_at
      t.time :close_at
      t.belongs_to :building

      t.timestamps
    end
    add_index :offices, :building_id
  end
end
