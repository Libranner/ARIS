require 'spec_helper'

describe Office do
  it 'validate field close_at is greater than field open_at' do
    office = build(:office, open_at: 1.hour.ago, close_at: 2.hour.ago)
    office.should have(1).error_on(:open_at)
  end

  it 'validate presence of fields available_from and available_until' do
    office = Office.new
    office.should have(2).error_on(:open_at)
    office.should have(1).error_on(:close_at)
  end

  it 'validate on floor must be greater than  0 and less than floor field of the building' do
    building = create(:building, floors: 2)
    office = build(:office, building: building, on_floor: 3)
    office.should have(1).error_on(:on_floor)
  end

end
