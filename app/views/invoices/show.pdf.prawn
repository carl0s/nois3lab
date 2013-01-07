pdf.font_families.update(
  "Gotham" => { :normal => "#{Rails.root}/public/fonts/Gotham-Light.ttf",
                :bold   => "#{Rails.root}/public/fonts/Gotham-Bold.ttf" }
)

logo = "#{Rails.root}/public/images/nois3lab_invoice.png"
pdf.image logo, :at => [520,720], :scale => 0.5

pdf.font('Gotham')
  pdf.fill_color "999999"
    pdf.text @company.name, :size => 9
    pdf.text "#{@company.address} - #{@company.country}", :size => 9
    pdf.text "P.IVA #{@company.vat}", :size => 9
    pdf.text "email: #{@company.email}", :size => 9
    pdf.text "phone n: #{@company.phone}", :size => 9

  pdf.fill_color(15,100,80,5)
    pdf.text_box "Invoice #{@invoice.invoice_number}", :size => 24, :style => :bold, :at => [0, 650]
    pdf.text_box "DESCRIZIONE", :size => 13, :style => :bold, :at => [0, 505]
    pdf.text_box "BONIFICO/WIRE TRANSFER", :size => 13, :style => :bold, :at => [0,45]
    pdf.text_box "IBAN #{@company.iban}", :size => 10, :at => [0,20]
    pdf.text_box "BIC/SWIFT #{@company.swift}", :size => 10, :at => [0, 10]

  pdf.fill_color(0,0,0,75)
    pdf.text_box "Spett.le", :size => 11, :at => [0, 600]
    pdf.text_box "#{@invoice.client.name}", :size => 16, :style => :bold, :at => [0, 585]


  pdf.fill_color(15,100,80,5)
    pdf.text_box "DESCRIZIONE", :size => 13, :style => :bold, :at => [0, 505]
    pdf.fill_color(0,0,0,75)
    pdf.text_box @invoice.description.html_safe, :size => 10, :at => [0, 485]

@invoice.items.each do |t|
  pdf.text "a"
end
