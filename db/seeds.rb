# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user1 = User.create!(name: "deeksha", email: "dee1@12.com", password: "password")
@user2 = User.create!(name: "rohit", email: "ro1@12.com", password: "password")
@event1 = Event.create!(name: 'Interview Process Meet', description: 'discuss on interview approaches', time: Time.now, duration: 2.hours)
@user1.user_events.create!(event: @event1)
@user1.events.first.invites.create!(sender_id: @user1.id, recipient_id: @user2.id, email: @user2.email)
