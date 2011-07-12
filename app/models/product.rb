class Product < ActiveRecord::Base
  # ASSOCIATIONS
  has_many :articles
  has_many :subcategories, :through => :articles
  has_many :categories, :through => :subcategories

  # VALIDATIONS
  validates :name, :uniqueness => true

  # FRIENDLY ID
  has_friendly_id :name, :use_slug => true
  
  # FILTER METHODS
  def self.get_products_filtered(product_name, subcategory_name, page=1, order='asc')
    select{distinct(id)}.joins{categories}
    .where{(products.name =~ "%#{product_name.to_s}%") & (categories.name =~ "%#{subcategory_name.to_s}%")}
    .select{([name, description, price_for_sale, discount, color, created_at, updated_at])}
    .order{products.name.send(order.to_sym)}
    .page(page).per(10)
  end
  
  private
  
  def self.get_column_names
    column_name = Product.column_names
    column_name.delete('id')
    column_name.each_with_index do |element, index|
      column_name[index] = "products." + element
    end
    column_name
  end
end
