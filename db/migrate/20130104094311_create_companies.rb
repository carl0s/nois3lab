class CreateCompanies < ActiveRecord::Migration
  def up
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :address_2
      t.string :email
      t.string :phone
      t.string :city
      t.string :zipcode
      t.text   :country
      t.string :vat
      t.string :fiscal
      t.string :iban
      t.string :swift
      t.string :timestamps
    end
  end
end
