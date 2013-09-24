# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create( name: 'Chill Out' )
Category.create( name: 'Dubstep' )
Category.create( name: 'Electro' )
Category.create( name: 'Hard Dance' )
Category.create( name: 'House' )
Category.create( name: 'Minimal' )
Category.create( name: 'Progressive' )
Category.create( name: 'Psy-Trance' )
Category.create( name: 'Tech House' )
Category.create( name: 'Techno' )
Category.create( name: 'Trance' )
Category.create( name: 'Other' )

user = User.create(
  name: 'Campaign Maker',
  email: 'campaign_maker@example.com',
  password: 'campaign_maker',
  password_confirmation: 'campaign_maker'
)

musician = Musician.create(user: user)

SoundcloudAccount.create(
  musician: musician,
  access_token: '1-48603-47808088-cf33ec002ba918b',
  soundcloud_avatar: 'https://i1.sndcdn.com/avatars-000044514130-7w9t5q-large.jpg?3eddc42',
  soundcloud_profile: 'http://soundcloud.com/pedroheadblendr',
  soundcloud_uid: '478080880',
  soundcloud_username: 'pedroheadblendr'
)

User.create(
  name: 'Reservation Maker',
  email: 'reservation_maker@example.com',
  password: 'reservation_maker',
  password_confirmation: 'reservation_maker'
)
