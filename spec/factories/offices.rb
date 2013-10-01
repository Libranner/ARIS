# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :office do
    name "MyString"
    description "MyText"
    open_at 1.hour.ago
    close_at 2.hour.ago
    on_floor 1
    building
  end
end
