require 'spec_helper'

describe Reservation do
  it 'validate field to is greater than field from' do
    reservation = build(:reservation, finish: 2.hours.ago, start: 1.hours.ago )
    reservation.should have(1).error_on(:start)
  end

  it 'validate presence of fields from and to' do
    reservation = Reservation.new
    reservation.should have(2).error_on(:start)
    reservation.should have(1).error_on(:finish)
  end


  it 'validate does not exist a reservation for the select room' do
    build(:reservation)
    reservation2 = create(:reservation)
    reservation2.should have(1).error_on(:start)
  end

end
