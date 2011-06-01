Factory.sequence :number do |n|
  n
end

Factory.define :presentation do |p|
  p.name "Presentation_#{Factory.next :number}"
end
