# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p1 = Player.create(username: "Sheldon", password: "pword1", current_level: 0, display_name: "The Flash")
p2 = Player.create(username: "Leonard", password: "pword2", current_level: 1, display_name: "Cheescake Factory")
p3 = Player.create(username: "RajK", password: "pword3", current_level: 1, display_name: "Ladies Man")

bf1 = Battlefield.create(name: "Turin")
bf2 = Battlefield.create(name: "Borg")
bf3 = Battlefield.create(name: "Babbage")

b1 = Battle.create(evolution_level: 0, battlefield: bf1)
b2 = Battle.create(evolution_level: 0, battlefield: bf1)

m1 = Move.create(symbol: "rock", player: p1, battle: b1)
m2 = Move.create(symbol: "paper", player: p2, battle: b1)
m3 = Move.create(symbol: "paper", player: p1, battle: b2)
m4 = Move.create(symbol: "scissors", player: p3, battle: b2)
