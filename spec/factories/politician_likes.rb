# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :politician_like do
    liker_id 1
    liked_id 1
    value false
  end
end
