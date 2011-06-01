Factory.sequence :number do |n|
  n
end

Factory.define :product do |p|
  p.name "name_#{Factory.next(:number)}"
end
