class Article < ActiveRecord::Base
  # VALIDATIONS
  validates :name, :uniqueness => true
end
