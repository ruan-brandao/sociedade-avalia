# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	first_name "Elei"
  	last_name "Tor"
  	username "eleitor"
  	birth_date { 18.years.ago }
  	gender "male"
  	email { "#{username.downcase}@example.com" }
  	password "Senha123"
  end
end
