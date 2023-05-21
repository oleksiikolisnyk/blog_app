# frozen_string_literal: false

class GenerateQrCodeService
  include Rails.application.routes.url_helpers

  def initialize(order)
    @order = order
  end

  def call
    result_html_code = ''

    @order.sellable_items.each do |sellable_item|
      sellable_item.payment_tickets.each do |payment_ticket|
        payment_ticket.generate_pdf_qr_code! unless payment_ticket.qr_code.attached?
        result_html_code << "<img src=\'#{url_for(payment_ticket.qr_code)}\'> </img><br>"
      end
    end

    result_html_code
  end
end
