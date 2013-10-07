class RemoveAvailableFromAndAvailableUntilOnClassrooms < ActiveRecord::Migration
  def down
    add_column :classrooms, :available_from, :time
    add_column :classrooms, :available_until, :time
  end

  def up
    remove_column :classrooms, :available_from, :available_until
  end
end
