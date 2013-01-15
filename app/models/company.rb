class Company < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible  :name, :address, :address_2, :city, :zipcode, :country, :email, :phone, :vat, :fiscal, :iban, :swift, :facebook, :twitter, :tumblr, :behance

end
