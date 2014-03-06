# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :song do
    title
    parent_id 1
    year
    date "2014-03-07"
  end
end
