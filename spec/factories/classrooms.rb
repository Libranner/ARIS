# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classroom do
    name "GC-101"
    sits 1
    on_floor 1
    building
  end
end
