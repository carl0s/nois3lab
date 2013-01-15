class AddTumblr < ActiveRecord::Migration
  def up
    change_table :companies do |t|
      t.string :tumblr
      t.string :facebook
      t.string :twitter
    end

    change_table :clients do |t|
      t.string :address
      t.string :address_2
      t.string :email
      t.string :phone
      t.string :city
      t.string :zipcode
      t.string :country
      t.string :vat
      t.string :fiscal
      t.string :iban
      t.string :swift

    end
  end

  def down
    remove_column :companies, :tumblr
    remove_column :companies, :facebook
    remove_column :companies, :twitter

    remove_column :clients, :address
    remove_column :clients, :address_2
    remove_column :clients, :email
    remove_column :clients, :phone
    remove_column :clients, :city
    remove_column :clients, :zipcode
    remove_column :clients, :country
    remove_column :clients, :vat
    remove_column :clients, :fiscal
    remove_column :clients, :iban
    remove_column :clients, :swift
  end
end
