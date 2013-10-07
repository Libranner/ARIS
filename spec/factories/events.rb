# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    start_date "2013-10-07 01:13:37"
    end_date "2013-10-07 01:13:37"
    description "MyText"
    sits 1
  end
end
