class Item < ActiveRecord::Base
  attr_accessible :description, :invoice_id, :name
  belongs_to :invoice

  def clients
    clients = Client.find(:all)
  end

  def discounts
    discounts = Discount.find(:all)
  end

  def taxes
    taxes = Taxis.find(:all)
  end

  def total
    return quantity * unit_price
  end

end
