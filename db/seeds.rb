# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#to seed users
josh = Client.create(name: "Josh Gumerove")
juan = Client.create(name: "Juan Sierra")
albert = Client.create(name: "Alberto Primos")

josh.returns.create(time_estimate: 30, due_date: Date.new(2022, 4, 17), return_type: "1040", description: "1040 return for a big client")
josh.returns.create(time_estimate: 20, due_date: Date.new(2022, 5, 17), return_type: "1065", description: "1065 return for a big client")
albert.returns.create(time_estimate: 30, due_date: Date.new(2022, 5, 17), return_type: "1041", description: "1041 return for a big client")
albert.returns.create(time_estimate: 22, due_date: Date.new(2022, 5, 17), return_type: "1040", description: "1040 return for a big client")
juan.returns.create(time_estimate: 22, due_date: Date.new(2022, 5, 17), return_type: "1040", description: "1040 return for a big client")