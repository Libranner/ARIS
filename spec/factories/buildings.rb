# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    sequence(:name) {|n| "Edificio#{n}"}
    sequence(:abbreviation) {|n| "E#{n}"}
    rooms 10
    floors 2
  end
end
