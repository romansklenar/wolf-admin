# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new(full_name: "Dummy Admin", email: "admin@example.com", locale: "en", time_zone: "Prague", password: "topsecret", password_confirmation: "topsecret", role: "administrator")
admin.confirm
admin.save!

user = User.new(full_name: "John Doe", email: "john.doe@example.com", locale: "en", time_zone: "Prague", password: "topsecret", password_confirmation: "topsecret")
user.confirm
user.save!
