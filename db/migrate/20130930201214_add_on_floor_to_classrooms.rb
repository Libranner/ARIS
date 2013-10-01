class AddOnFloorToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :on_floor, :integer
  end
end
