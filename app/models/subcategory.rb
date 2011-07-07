class Subcategory < ActiveRecord::Base

  # ASSOCIATIONS
  has_many :articles
  has_many :products, :through => :articles
  belongs_to :category

  # VALIDATIONS
end
