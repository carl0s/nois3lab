# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tag.create(name: 'a')
Tag.create(name: 'b')
Tag.create(name: 'c')

Teammate.create(fullname: 'Nome Cognome')

Work.create(name: 'Test')

Client.create(name: 'Test Client')
