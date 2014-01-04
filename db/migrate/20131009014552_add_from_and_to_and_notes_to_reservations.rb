class AddFromAndToAndNotesToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :notes, :text
    add_column :reservations, :start, :datetime
    add_column :reservations, :finish, :datetime
  end
end
