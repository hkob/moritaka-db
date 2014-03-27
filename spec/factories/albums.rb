# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :album do
    type "Album"
    device_type 1
    title
    date "2014-03-21"
    minutes 12
    seconds 34
    sort_order 10
    number "1st"
    year
    association :singer, factory: :person
    j_comment "MyString"
    e_comment "MyString"
  end
end

