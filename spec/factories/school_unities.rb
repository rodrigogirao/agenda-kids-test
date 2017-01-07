FactoryGirl.define do
  factory :school_unity do
    name Faker::Company.name
    address Faker::Address.full_address
  end
end
