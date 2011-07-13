module ApplicationHelper

  # THIS METHOD RECEIVE A FLOAT NUMBER EX: 12.33
  # ALSO THE TWO HTML TAGS THAT IS GOING TO WRAP THE NUMBER
  # RETURNS IT IN TWO PARTS, CREATING AN HTML TAG
  # THE RESULT IS:
  # <div class='article-price>12,<span>33</span></div>
  def price_format(object, method="price_for_sale", tag1=:div, tag2=:span)
    price = object.send(method.to_sym).to_s.split(".")
    return content_tag tag1, :class => "article-price" do
      concat(price[0])
      concat(",")
      concat(content_tag tag2, price[1])
    end
  end

  # THIS METHOD RECEIVES A COLLECTION OF ACTIVE RECORD
  # AND RETUNRS THE FIRST ELEMENT OF THE PAGINATION
  # OBJECT.
  def pagination_from(collection)
    collection.offset_value + 1
  end

  # THIS METHODS RECEIVES A COLLECTION OF ACTIVE RECORD
  # AND RETUNRS THE TOTAL OF DISPLAYED ITMEMS IN
  # THE PAGINATION.
  def pagination_to(collection)
    collection.offset_value + collection.limit_value
  end

end
