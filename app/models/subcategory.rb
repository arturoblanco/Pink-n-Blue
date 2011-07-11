class Subcategory < ActiveRecord::Base

  # ASSOCIATIONS
  has_many :articles
  has_many :products, :through => :articles
  has_many :category_subcategories
  has_many :categories, :through => :category_subcategories

  # VALIDATIONS
end
