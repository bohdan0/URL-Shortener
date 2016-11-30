# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(email: "email@awesome.com")

shortened_url1 = ShortenedUrl.create!(user_id: 1,
  short_url: "http://short.com", long_url: "http://really-long-url.com")
