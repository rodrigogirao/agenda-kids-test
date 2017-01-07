FactoryGirl.define do
  factory :school do
    name Faker::Company.name
    cnpj CNPJ.generate
  end
end
