pdf.font_families.update(
  "Gotham" => { :normal => "#{Rails.root}/public/fonts/Gotham-Light.ttf",
                :bold   => "#{Rails.root}/public/fonts/Gotham-Bold.ttf" }
)

logo = "#{Rails.root}/public/images/nois3lab_invoice.png"
pdf.image logo, :at => [520,720], :width => 42

pdf.font('Gotham')
  pdf.fill_color "999999"
    pdf.text @company.name, :size => 9
    pdf.text "#{@company.address} - #{@company.country}", :size => 9
    pdf.text "P.IVA #{@company.vat}", :size => 9
    pdf.text "email: #{@company.email}", :size => 9
    pdf.text "phone n: #{@company.phone}", :size => 9

  pdf.fill_color(15,100,80,5)
    pdf.text_box "Nota di credito #{@invoice.credit_number}", :size => 24, :style => :bold, :at => [0, 650]
    pdf.text_box "DESCRIZIONE", :size => 13, :style => :bold, :at => [0, 505]
    pdf.text_box "BONIFICO/WIRE TRANSFER", :size => 13, :style => :bold, :at => [0,45]
    pdf.text_box "IBAN #{@company.iban}", :size => 10, :at => [0,20]
    pdf.text_box "BIC/SWIFT #{@company.swift}", :size => 10, :at => [0, 10]

  pdf.fill_color(0,0,0,75)
    pdf.text_box "Spett.le", :size => 11, :at => [0, 600]
    pdf.text_box "#{@invoice.client.name}", :size => 16, :style => :bold, :at => [0, 585]
    pdf.text_box "#{@invoice.client.address}", :size => 9, :style => :normal, :at => [0, 565]
    pdf.text_box "#{@invoice.client.zipcode} - #{@invoice.client.city}", :size => 9, :style => :normal, :at => [0, 550]
    pdf.text_box "#{@invoice.client.vat}", :size => 9, :style => :normal, :at => [0, 535]


  pdf.fill_color(15,100,80,5)
    pdf.text_box "DESCRIZIONE", :size => 13, :style => :bold, :at => [0, 505]
    pdf.fill_color(0,0,0,75)
    pdf.text_box @invoice.description.html_safe, :size => 10, :at => [0, 485]


  items = @invoice.items.map do |t|
      [
        t.name,
        t.quantity.to_s,
        "-" + t.unit_price.to_s,
        "-" + t.total.to_s + " EUR"
      ]
    end

pdf.move_down(250)
pdf.font('Gotham')
  pdf.table(items, ) do
    row(0..20).style(:background_color => 'eeeeee', :text_color => 'cc0000', :borders => [:bottom], :border_color => 'ffffff', :border_width => 2, :padding_bottom => 1, :size => 10, :font_style => :normal)
    row(0..20).height = 20
    column(0).width = 350
    column(1).width = 40
    column(1).style(:align => :center)
    column(2).width = 65
    column(2).style(:align => :center)
    column(3).width = 85
    column(3).style(:align => :right, :font_style => :bold)
  end


pdf.move_down(50)
pdf.font('Gotham')
  pdf.text "SUBTOTALE CREDITO -" + @invoice.subtotal.to_s + " EUR", :size => 18, :align => :right


