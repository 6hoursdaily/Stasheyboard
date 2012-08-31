# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create Admin user

Admin.create!({email: "admin@rashboard.com", password: "password"})


# services!

Service.create!({name: "Server 1"})
Service.create!({name: "Server 2"})

# statuses!

Status.create!({name: "Up"})
Status.create!({name: "Down"})
Status.create!({name: "Troubled"})