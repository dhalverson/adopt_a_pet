FactoryBot.define do
  factory :shelter do
    name { Faker::Company.name + " Shelter" }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Number.number(digits: 5).to_s }
    hours_of_operation { "9:00am - 5:00pm" }
  end
end
