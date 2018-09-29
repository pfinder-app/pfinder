# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: 'Emily', scoutname: 'Folletta', birthdate: '1991-01-01', canton: :zh, scoutgroup: 'Pfadi Züri')
u2 = User.create(name: 'Diego', scoutname: 'Filou', birthdate: '1988-01-01', canton: :be, scoutgroup: 'Korps Limmat')
