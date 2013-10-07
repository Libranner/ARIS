# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    name "MyString"
    description "MyText"
    status 1
    email_petitioner "MyString"
  end
end
