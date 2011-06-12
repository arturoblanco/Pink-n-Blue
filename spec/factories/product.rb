Factory.sequence :number do |n|
  n
end

Factory.define :product do |p|
  p.name "name_#{Factory.next(:number)}"
  #{:name => "Product 1", :price_for_sale => 12.12, :color => "blue, red", :description => "Description 1"}
end
