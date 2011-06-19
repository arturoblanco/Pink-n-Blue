module ApplicationHelper

  def price_format(object, method = "price_for_sale")
    h = ""
    price = object.send(method.to_sym).to_s.split(".")
    return content_tag :div, :class => "article-price" do
      concat(price[0])
      concat(",")
      concat(content_tag :span, price[1])
    end
  end
end
