Shelter.destroy_all
Pet.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

denver_animal_shelter = Shelter.create!(
  name: 'Denver Animal Shelter',
  address: '1241 Bayaud Ave',
  city: 'Denver',
  state: 'CO',
  zip: '80223',
  open: true
)

dumb_friends_league = Shelter.create!(
  name: 'Dumb Friends League',
  address: '2080 S Quebec Street',
  city: 'Denver',
  state: 'CO',
  zip: '80231',
  open: true
)
5.times do
  dumb_friends_league.pets.create!(
    name: Faker::Creature::Dog.name,
    age: Faker::Number.within(range: 0..25),
    sex: Faker::Creature::Dog.gender,
    breed: Faker::Creature::Dog.breed,
    adopted: Faker::Boolean.boolean(true_ratio: 0.8),
    description: Faker::Lorem.paragraph,
    species: ['cat', 'dog'].sample
  )
end

5.times do
  denver_animal_shelter.pets.create!(
    name: Faker::Creature::Dog.name,
    age: Faker::Number.within(range: 0..25),
    sex: Faker::Creature::Dog.gender,
    breed: Faker::Creature::Dog.breed,
    adopted: Faker::Boolean.boolean(true_ratio: 0.8),
    description: Faker::Lorem.paragraph,
    species: ['cat', 'dog'].sample
  )
end
print 'Database seeding successful!'