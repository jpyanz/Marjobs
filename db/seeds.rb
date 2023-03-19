# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Admin', username: 'admin', password: '12345', role: 'admin', created_at: '2022-12-30 08:03:36.553375', updated_at: '2023-02-11 16:53:02.068541')
User.create(name: 'Moderator', username: 'moderator', password: '12345', role: 'moderator', created_at: '2022-12-30 08:03:36.553375', updated_at: '2023-02-11 16:53:02.068541')