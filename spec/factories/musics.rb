# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :music do
    song
    person
    sort_order 1
  end
end
