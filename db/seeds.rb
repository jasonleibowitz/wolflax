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

Camp.create(name: "Boise, ID", description: "Test camp in Boise Idaho", price: 299.00, location_name: "Heritage Middle School", location_street_one: "4990 N Meridian Rd", city: "Meridian", state: "ID", zipcode: 83646, starting_date: Chronic.parse("06/08/2015"), ending_date: Chronic.parse("06/10/2015"))
Camp.create(name: "San Diego, CA", description: "Test camp in San Diego", price: 299.00, location_name: "Torrey Pines High School", location_street_one: "3710 Del Mar Heights Rd", city: "San Diego", state: "CA", zipcode: 92130, starting_date: Chronic.parse("07/27/2015"), ending_date: Chronic.parse("07/29/2015"))
Camp.create(name: "Detroit, MI", description: "Test camp in Detroit", price: 299.00, location_name: "Wayne State University", location_street_one: "42 W Warren Ave", city: "Detroit", state: "MI", zipcode: 48202, starting_date: Chronic.parse("08/04/2015"), ending_date: Chronic.parse("08/07/2015"))
Camp.create(name: "Virginia Beach, VA", description: "Test camp in Virginia Beach", price: 299.00, location_name: "Norfolk Collegiate High School", location_street_one: "7336 Granby St", city: "Norfolk", state: "VA", zipcode: 23505, starting_date: Chronic.parse("08/20/2015"), ending_date: Chronic.parse("08/22/2015"))
Camp.create(name: "Miami, FL", description: "Test camp in Miami Beach", price: 299.00, location_name: "Raw Lacrosse", location_street_one: "325 S Biscayne Blvd", location_street_two: "#2515", city: "Miami", state: "FL", zipcode: 33131, starting_date: Chronic.parse("09/05/2015"), ending_date: Chronic.parse("09/07/2015"))
