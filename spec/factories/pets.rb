FactoryBot.define do
  factory :pet do
    name { Faker::Movies::HarryPotter.character }
    age { Faker::Number.within(range: 1..10) }
    sex { Faker::Gender.binary_type }
    breed { Faker::Creature::Dog.breed }
    adopted { Faker::Boolean.boolean(true_ratio: 0.1) }
    description { Faker::TvShows::MichaelScott.quote }
    species { ['cat', 'dog'].sample }
    shelter
  end
end
