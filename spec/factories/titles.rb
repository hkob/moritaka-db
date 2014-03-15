# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :title do
    sequence(:japanese) { |n| "日本語　英語_#{n}" }
    english "English Japanese"
    yomi "にほんご　えいご"
    yomi_suuji ""
  end
end
