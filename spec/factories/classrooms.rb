# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classroom do
    name "GC-101"
    available_from 3.hour.ago
    available_until 2.hour.ago
    sits 1
    on_floor 1
    building
  end
end
