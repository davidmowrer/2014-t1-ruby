# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Member.create id: 1,
  username: "jen",
  password: "123",
  password_confirmation: "123"
Member.create id: 2,
  username: "ted",
  password: "456",
  password_confirmation: "456"

Car.create! color: "red",   model: "VW Golf", member_id: nil
Car.create! color: "black", model: "VW Jetta", member_id: 1
Car.create! color: "white", model: "Toyota Celica", member_id: nil