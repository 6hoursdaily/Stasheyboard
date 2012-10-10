# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create Admin user

# admin_user = Admin.create!({email: "admin@stasheyboard.com", password: "password"})

# services!

Service.delete_all
Status.delete_all
Admin.delete_all

Admin.create!(email: "admin@stasheyboard.com", password: "password",
              password_confirmation: "password")

Service.create!({name: "Ulysses"})
Service.create!({name: "Goliath"})
Service.create!({name: "Zeus"})

# statuses!

statuses = ['Down', 'Up', 'Troubled']
service_ids = [*4..6]
dates = [1.day.ago, 2.days.ago, 3.days.ago, 4.days.ago, 5.days.ago, 6.days.ago]

100.times { Status.create(name: statuses.shuffle.first,
       created_at: dates.shuffle.first, service_id: service_ids.shuffle.first) }