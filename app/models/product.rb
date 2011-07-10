class Product < ActiveRecord::Base
  # ASSOCIATIONS
  has_many :articles
  has_many :subcategories, :through => :articles

  # VALIDATIONS
  validates :name, :uniqueness => true

  # FRIENDLY ID
  has_friendly_id :name, :use_slug => true
  
  # FILTER METHODS
  def self.get_products_filtered(product_name, subcategory_name, page=1, order='asc')
    joins{subcategories.category}
    .where{(products.name =~ "%#{product_name.to_s}%") & (categories.name =~ "%#{subcategory_name.to_s}%")}
    .order{products.name.send(order.to_sym)}
    .page(page).per(10)
  end
end
