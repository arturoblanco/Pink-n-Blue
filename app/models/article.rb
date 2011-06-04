class Article < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :product
  belongs_to :subcategory
end
