class AddOnFloorToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :on_floor, :integer
  end
end
