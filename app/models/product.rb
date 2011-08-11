class Product < ActiveRecord::Base
  # ASSOCIATIONS
  has_many :articles
  has_many :cart_products
  has_many :subcategories, :through => :articles
  has_many :categories, :through => :subcategories

  # VALIDATIONS
  validates :name, :uniqueness => true

  # FRIENDLY ID
  has_friendly_id :name, :use_slug => true
  
  # FILTER METHODS
  def self.get_products_filtered(product_name, subcategory_name, page=1, order='asc')
    select{distinct(id)}.joins{categories.outer}
    .where{(products.name =~ "%#{product_name.to_s}%") & (categories.name =~ "%#{subcategory_name.to_s}%")}
    .select{([name, description, price_for_sale, discount, color, created_at, updated_at])}
    .page(page).per(20)
  end
  
end
