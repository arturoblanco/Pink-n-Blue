module ProductsHelper
  def is_new?(product)
    if (product.created_at + 2.weeks) >= Time.now
      return content_tag :span, "Novo !!", :class => "new_product"
    end
    ""
  end
end
