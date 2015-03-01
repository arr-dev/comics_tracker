# rubocop:disable Metrics/LineLength
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)

User.create!(email: "n.p@g.com", password: "12345678") do |u|
  u.confirm!
end

[46_568, 68_344, 77_575].each do |volume|
  Fetch::Volume.new(volume).call
end
