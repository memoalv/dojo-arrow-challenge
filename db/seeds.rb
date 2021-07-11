# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

icalier_1 = User.create(
  name: 'Icalier 1',
  email: 'icalier_1@icalialabs.com',
  password: '123456'
)

icalier_2 = User.create(
  name: 'Icalier 2',
  email: 'icalier_2@icalialabs.com',
  password: '123456'
)

10.times do |i|
  Arrow.create(
    to_user_id: icalier_1.id,
    content: "This is a seeded arrow #{i}",
    from_user_id: icalier_2.id
  )
end
