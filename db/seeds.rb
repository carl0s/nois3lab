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

Service.create(name: 'web')
Service.create(name: 'events')
Service.create(name: 'communication')

Teammate.create(fullname: 'Carlo Frinolli', bio: 'dummy bio', twitter: 'carl0s_', facebook: 'carlo.frinolli', linkedin: 'carlofrinolli')

Client.create(name: 'mozilla', content: 'Dummy content', url: 'http://www.mozilla.com')
