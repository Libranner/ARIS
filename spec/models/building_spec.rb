require 'spec_helper'

describe Building do
  it 'validate only two letters on the abbreviation field' do
    building = build(:building, abbreviation: 'EDE')

    building.should have(1).error_on(:abbreviation)
    #visit new_building_path
    #fill_in 'Abbreviation', with: building.abbreviation

  end

  it 'validate rooms field is greater than zero' do
    building = build(:building, rooms:0)
    building.should have(1).error_on(:rooms)
  end

  it 'validate uniqueness of name field' do
    create(:building, name: 'Edificio', abbreviation: 'ED')
    classroom = build(:building,name:'Edificio', abbreviation: 'ED')
    classroom.should have(1).error_on(:name)
  end

end
