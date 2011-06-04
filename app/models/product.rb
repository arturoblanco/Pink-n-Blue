class Product < ActiveRecord::Base
  # ASSOCIATIONS
  has_many :articles
  has_many :subcategories, :through => :articles

  # VALIDATIONS
  validates :name, :uniqueness => true
end
