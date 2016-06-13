# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(
  email: "christopher.brenner1@yahoo.com",
  password: "password",
  first_name: "Chris",
  last_name: "Brenner",
  height: 70,
  weight: 170,
  birth_date: Date.strptime("05/29/1986", "%m/%d/%Y"),
  is_admin: true
)

Run.create(
  occurred_at: Time.zone.now,
  distance: 5.01,
  time: 2580,
  user: admin
)
