# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    name "MyString"
    description "MyText"
    state_id 1
    email_petitioner "MyString"
    start 2.hour.ago
    finish 1.hour.ago
    classroom_id 1
  end
end
