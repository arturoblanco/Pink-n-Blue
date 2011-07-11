class CategorySubcategory < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :category
  belongs_to :subcategory
end
