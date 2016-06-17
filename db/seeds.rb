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
  distance_attributes: { unit: "mi", length: 5.01 },
  user: admin,
  duration_attributes: { hours: 0, minutes: 45, seconds: 30 }
)

Run.create(
  occurred_at: Time.zone.now.beginning_of_month - 1.day,
  distance_attributes: { unit: "mi", length: 4.01 },
  user: admin,
  duration_attributes: { hours: 0, minutes: 34, seconds: 19 }
)

Run.create(
  occurred_at: Time.zone.now.beginning_of_week - 1.day,
  distance_attributes: { unit: "mi", length: 6.01 },
  user: admin,
  duration_attributes: { hours: 0, minutes: 53, seconds: 30 }
)

user_1 = User.create(
  email: "kristinapecora@gmail.com",
  password: "password",
  first_name: "Kristina",
  last_name: "Pecora",
  height: 62,
  weight: 125,
  birth_date: Date.strptime("10/09/1978", "%m/%d/%Y"),
  is_admin: true
)

Run.create(
  occurred_at: Time.zone.now,
  distance_attributes: { unit: "mi", length: 5.01 },
  user: user_1,
  duration_attributes: { hours: 0, minutes: 47, seconds: 30 }
)
