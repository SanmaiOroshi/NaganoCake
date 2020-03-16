module ApplicationHelper

  def disp_price(price)
    price.to_s(:delimited)
  end

  def disp_tax_price(price)
    ((price * 1.1).floor).to_s(:delimited)
  end
end
