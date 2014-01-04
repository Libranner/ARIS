class AddClassroomIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :classroom_id, :integer
  end
end
