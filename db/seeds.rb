# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shelter.destroy_all
Pet.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

5.times do
  Shelter.create(
    name: Faker::Company.name + " Shelter",
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Number.number(digits: 5).to_s,
    open: Faker::Boolean.boolean(true_ratio: 0.8)
  )
end

20.times do
  Pet.create(
    name: Faker::Creature::Dog.name,
    age: Faker::Number.within(range: 0..25),
    sex: Faker::Creature::Dog.gender,
    type: Faker::Creature::Dog.breed,
    adopted: Faker::Boolean.boolean(true_ratio: 0.8),
    description: Faker::Lorem.paragraph
  )
end

print 'Database seeding successful!'