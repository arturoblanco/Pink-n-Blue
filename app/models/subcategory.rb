class Subcategory < ActiveRecord::Base
  # ASSOCIATIONS
  has_many :articles
  has_many :products, :through => :articles

  # VALIDATIONS
end
