class Client < ActiveRecord::Base
  attr_accessible :content, :name, :url,:address, :address_2, :city, :zipcode, :country, :email, :phone, :vat, :fiscal, :iban, :swift
  has_many :works
  has_many :invoices

  validates :name, :presence => true

  extend FriendlyId
  friendly_id :name, :use => :slugged

end
