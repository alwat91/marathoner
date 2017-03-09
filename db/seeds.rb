# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Run.destroy_all

user1 = User.create(email: "a@a.com", password: "a")

user1.runs.create(mileage: 2.2, beginning_time: "2017-03-09T10:54:59-05:00".to_datetime, end_time: "2017-03-09T11:54:59-05:00".to_datetime, duration_in_secs: 60*60)
user1.runs.create(mileage: 5.7, beginning_time: "2017-03-08T10:54:59-05:00".to_datetime, end_time: "2017-03-08T11:54:59-05:00".to_datetime, duration_in_secs: 60*60)
user1.runs.create(mileage: 3.0, beginning_time: "2017-03-07T10:54:59-05:00".to_datetime, end_time: "2017-03-07T11:54:59-05:00".to_datetime, duration_in_secs: 60*60)
user1.runs.create(mileage: 2.4, beginning_time: "2017-03-06T10:54:59-05:00".to_datetime, end_time: "2017-03-06T11:54:59-05:00".to_datetime, duration_in_secs: 60*60)
user1.runs.create(mileage: 2.6, beginning_time: "2017-03-05T10:54:59-05:00".to_datetime, end_time: "2017-03-05T11:54:59-05:00".to_datetime, duration_in_secs: 60*60)

puts user1.runs
