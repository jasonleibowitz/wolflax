# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: "Jason", last_name: "Leibowitz", email: "jason@leibowitz.me", password: "sertgh67", password_confirmation: "sertgh67", admin: true)
User.create(first_name: "Jordan", last_name: "Wolf", email: "jordan.wolf@duke.edu", password: "silverturtle", password_confirmation: "silverturtle", admin: true)
User.create(first_name: "George", last_name: "Stein", email: "george_stein24@yahoo.com", password: "silverturtle", password_confirmation: "silverturtle", admin: true)
