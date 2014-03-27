# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    type ""
    device_type 1
    title_id 1
    date "2014-03-21"
    minutes 1
    seconds 1
    sort_order 1
    number "MyString"
    year_id 1
    singer_id 1
    j_comment "MyString"
    e_comment "MyString"
  end
end
