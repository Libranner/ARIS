class RemoveToAndFromOnReservations < ActiveRecord::Migration
  def up
    remove_column :reservations,:finish
    remove_column :reservations,:start
  end

  def down
    add_column :reservations, :finish, :datetime
    add_column :reservations, :start, :datetime
  end
end
