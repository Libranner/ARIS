class AddToDateToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :finish, :datetime
  end
end
