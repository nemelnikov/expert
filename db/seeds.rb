# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Genre.create(name: 'Space', description: 'Rockets, air, mechanisms')
Genre.create(name: 'Cooking', description: 'Dishes, spices,drinks')
Genre.create(name: 'Architecture', description: 'Buildings, streets, cities, counstructions. How to built your own house.')
Genre.create(name: 'Information Technology', description: 'From programming languages to hardware')
Genre.create(name: 'Traveling', description: 'Earning when travlling, routes, life-hacks')

p=Genre.find_by_name(:Space)
