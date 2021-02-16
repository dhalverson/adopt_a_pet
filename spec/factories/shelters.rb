FactoryBot.define do
  factory :shelter do
    name { Faker::Company.name + "Shelter"}
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Number.number(digits: 5).to_s }
    open { Faker::Boolean.boolean }
  end
end
