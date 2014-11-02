# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :political_party_like do
    user_id 1
    political_party_id 1
    value false
  end
end
