# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    content "MyText"
    likes 0
    dislikes 0
  end
end
