# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :political_party do
    name "Partido da Vida, Universo e Tudo Mais"
    siglum "PVUTM"
    number "42"
    position "Centro"
  end
end
