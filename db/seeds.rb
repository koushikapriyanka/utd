# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: "First Category")
Category.create(name: "Second Category")
User.create(username: "user1", email: 'user1@gmail.com', encrypted_password: 'user1@abcd')
20.times do |time|
	Project.create!(title: "#{time} Project", user: User.first, description: "This is the Description", category: Category.all[SecureRandom.random_number(2)])
end