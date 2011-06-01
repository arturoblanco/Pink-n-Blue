class Product < ActiveRecord::Base
  # VALIDATIONS
  validates :name, :uniqueness => true
end
