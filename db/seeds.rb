# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(email: "email@awesome.com")

user2 = User.create!(email: "sleep@awesome.com", premium: true)

shortened_url1 = ShortenedUrl.create!(user_id: 1,
  short_url: "http://short.com", long_url: "http://really-long-url.com")

  shortened_url2 = ShortenedUrl.create!(user_id: 1,
    short_url: "abcdefgh", long_url: "http://really-long-url-aaaaaahhhh.com")

tag_topic1 = TagTopic.create!(topic: "news")
tag_topic2 = TagTopic.create!(topic: "sports")

tagging1 = Tagging.create!(topic_id: 1, shortened_url_id: 1)
tagging1 = Tagging.create!(topic_id: 2, shortened_url_id: 1)

tagging3 = Tagging.create!(topic_id: 1, shortened_url_id: 2)
