# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tag.create(name: 'Ruby on Rails')
Tag.create(name: 'Drupal')
Tag.create(name: 'Wordpress')
Tag.create(name: 'CMS')
Tag.create(name: 'E-commerce')

Service.create(name: 'web', content:'dummy')
Service.create(name: 'events', content:'dummy')
Service.create(name: 'communication', content:'dummy')

Teammate.create(fullname: 'Nome Cognome', bio: 'dummy bio', twitter: '@dummy', facebook: 'name.lastname', linkedin: 'test')

Client.create(name: 'Test Client', content: 'Dummy content', url: 'http://www.example.com')
