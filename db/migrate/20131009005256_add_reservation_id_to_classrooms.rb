class AddReservationIdToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :reservation_id, :integer
  end
end
