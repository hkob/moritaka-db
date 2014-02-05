# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :title do
    japanese "日本語　英語"
    english "English Japanese"
    yomi "にほんご　えいご"
    yomi_suuji ""
  end
end
