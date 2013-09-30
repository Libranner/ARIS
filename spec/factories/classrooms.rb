# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classroom do
    name "GC-101"
    available_from "2013-09-29 21:20:05"
    available_until "2013-09-29 21:20:05"
    sits 1
    building
  end
end
