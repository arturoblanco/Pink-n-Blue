class Product < ActiveRecord::Base
  # ASSOCIATIONS
  has_many :articles
  has_many :subcategories, :through => :articles

  # VALIDATIONS
  validates :name, :uniqueness => true

  # FRIENDLY ID
  has_friendly_id :name, :use_slug => true
end
