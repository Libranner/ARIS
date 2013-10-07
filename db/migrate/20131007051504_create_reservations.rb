class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.string :email_petitioner

      t.timestamps
    end
  end
end
