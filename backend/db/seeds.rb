# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: 'Emily', scoutname: 'Folletta', birthdate: '1991-01-01', canton: :zh, scoutgroup: 'Pfadi Züri')
u2 = User.create(name: 'Diego', scoutname: 'Filou', birthdate: '1988-01-01', canton: :be, scoutgroup: 'Korps Limmat')

a1 = Activity.create(title: "Tichu", place: "grosses Zelt", begins_at: "2019-03-28 20:00:14", duration: 50, description: "Wer will Tichu Spielen?", creator_id: 2, max_participants: 4)
