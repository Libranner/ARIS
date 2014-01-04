class AddStartToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :start, :datetime
  end
end
