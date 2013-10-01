require 'spec_helper'

describe Classroom do
  it 'validate sits field is greater than zero' do
    classroom = build(:classroom, sits:0)
    classroom.should have(1).error_on(:sits)
  end

  it 'validate field available_until is greater than field available_from' do
    classroom = build(:classroom, sits:2, available_from: 1.hour.ago, available_until: 2.hour.ago)
    classroom.should have(1).error_on(:available_from)
  end

=begin
  it 'validate presence of fields available_from and available_until' do
    classroom = Classroom.new
    classroom.should have(2).error_on(:available_from)
    classroom.should have(1).error_on(:available_until)
  end
=end

  it 'validate uniqueness of name field' do
    create(:classroom,name: 'Aula 1', sits:2, available_from: 3.hour.ago, available_until: 2.hour.ago)
    classroom = build(:classroom,name: 'Aula 1', sits:2, available_from: 3.hour.ago, available_until: 2.hour.ago)
    classroom.should have(1).error_on(:name)
  end

  it 'validate on floor must be greater than  0 and less than floor field of the building' do
     building = create(:building, floors: 2)
     classroom = build(:classroom, building: building, on_floor: 3)
     classroom.should have(1).error_on(:on_floor)
  end

end
