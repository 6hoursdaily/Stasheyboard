# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create Admin user

admin_user = Admin.create!({email: "admin@stasheyboard.com", password: "password"})

# statuses!

Status.create!({name: "Up"})
Status.create!({name: "Down"})
Status.create!({name: "Troubled"})

# services!

Service.create!({name: "Ulysses"})
Service.create!({name: "Goliath"})
Service.create!({name: "Zeus"})

