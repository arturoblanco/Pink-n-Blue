Factory.sequence :number do |n|
  n
end

Factory.define :subarticle do |s|
  s.association :product
  s.association :presentation
  s.association :article
  s.in_stock 0
  s.price_for_sale 10.00
  s.price_of_buy 5.00
  s.discount 0.1
  s.color "blanco, azul, rojo"
end
