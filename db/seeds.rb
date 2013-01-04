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

Company.create(name: 'nois3lab di Carlo Frinolli e Davide Ferrante snc', address: 'Via Mario Cingolani 18, 00155 Roma', address_2: '', city: 'Rome', zipcode: '00155', country: 'Italy', email: 'info@nois3lab.it', phone: '+390645553446', vat: 'IT09393841003', fiscal: '', iban: 'IT 12F 02008 05264 000010803748', swift: 'UNCRITM1D48')

Taxis.create(name: 'IVA', value:'21', description:'')
Taxis.create(name: 'EU', value:'0', description:'Fuori campo IVA EU')

Discount.create(value:'10')
Discount.create(value:'20')
Discount.create(value:'30')
Discount.create(value:'40')
Discount.create(value:'50')

InvoiceNumbers.create(number: '1', year:Date.today.year)
