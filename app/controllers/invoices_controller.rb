class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end


  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @company = Company.first
    @invoice = Invoice.find(params[:id])
    @invoice.client = Client.find(@invoice.client_id)
    @items = Item.find_all_by_invoice_id(@invoice.invoice_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoice }
      format.pdf do
        render :pdf => "file_name"
      end
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new
    @counter = InvoiceNumbers.first
    @items = Item.find_all_by_invoice_id(@invoice.invoice_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
    @counter = InvoiceNumbers.first
    @items = Item.find_all_by_invoice_id(@invoice.invoice_id)
  end

  # POST /invoices
  # POST /invoices.json
  def create

    @invoice = Invoice.new(params[:invoice])
    @invoice.client_id = params[:clients]
    @invoice.discount_id = params[:discount_id]
    @invoice.tax_id = params[:tax_id]
    @counter = InvoiceNumbers.first
    if @counter.year != Date.today.year
      @counter.year = Date.today.year
      @counter.number = 0
    end
    @counter.number += 1
    @counter.save!
    @invoice.year = @counter.year
    @invoice.invoice_id = @counter.number

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])
    @invoice.year = Date.today.year

    @invoice.client_id = params[:clients]
    @invoice.discount_id = params[:discount_id]
    @invoice.tax_id = params[:tax_id]


    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  def remove_item
    @item = Item.find(params[:id])
    @item.destroy
  end

end
