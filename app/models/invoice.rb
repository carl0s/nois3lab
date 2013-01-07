class Invoice < ActiveRecord::Base
  attr_accessible :description, :doc_id, :invoice_id, :client_id, :name, :discount_id, :tax_id
  belongs_to :client
  has_many :items

  validates :name, :presence => true
  validates :client_id, :presence => true

  def invoice_number
    @counter = InvoiceNumbers.first
    if @counter.year != Date.today.year
      @counter.year = Date.today.year
      @counter.number = 0
    end
    @counter.number += 1
    #@counter.save!
    invoice_number= 'n3-' + @counter.number.to_s + '-' + @counter.year.to_s
  end

  def clients
    clients = Client.find(:all)
  end

  def discounts
    discounts = Discount.find(:all)
  end

  def taxes
    taxes = Taxis.find(:all)
  end

  def subtotal
    ret = 0
    # @items = Item.find :all, :conditions => [ 'invoice_id = ?', @invoice.invoice_id ]
    #@items.each do |item|
    #  ret += item.total
    #end
    return ret
  end

end




