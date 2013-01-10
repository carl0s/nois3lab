class Invoice < ActiveRecord::Base
  attr_accessible :description, :doc_id, :invoice_id, :client_id, :name, :discount_id, :tax_id
  belongs_to :client
  has_many :items, :dependent => :destroy

  DRAFT = :draft
  PENDING = :pending
  ISSUED = :issued
  SENT = :sent

  validates :name, :presence => true
  validates :client_id, :presence => true

  def invoice_number
    return 'FT-' + invoice_id.to_s + '-' + year.to_s
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
    items = Item.find_all_by_invoice_id(invoice_id)
    #logger.info items
    items.each do |t|
      ret += t.total
    end
    return ret
  end

end




