# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
Category.destroy_all

Category.create(name:"C#")
Category.create(name:"Java")
Category.create(name:"Javascript")
Category.create(name:"Python")
Category.create(name:"Ruby")
Category.create(name:"Memes")
