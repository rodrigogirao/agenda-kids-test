FactoryGirl.define do
  factory :schools do
    name Faker::Company.name
    cnpj CNPJ.generate
  end
end
