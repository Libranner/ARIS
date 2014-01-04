class AddStateIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :state_id, :integer
  end
end
