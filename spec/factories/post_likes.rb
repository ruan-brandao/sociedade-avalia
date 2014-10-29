# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post_like do
    user_id 1
    post_id 1
    value 1
  end
end
