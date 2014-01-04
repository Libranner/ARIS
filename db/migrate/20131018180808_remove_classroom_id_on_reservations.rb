class RemoveClassroomIdOnReservations < ActiveRecord::Migration
  def up
    remove_column :reservations, :classroom_id
  end

  def down
    add_column :reservations, :classroom_id, :integer
  end
end
