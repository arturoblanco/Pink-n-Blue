Factory.sequence :number do |n|
  n
end

Factory.define :article  do |a|
  a.name "Article_#{Factory.next :number}"
  a.description "This is a preset description #{Factory.next :number}"
end
