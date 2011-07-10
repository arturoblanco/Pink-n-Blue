# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# CREATING CATEGORIES AND SUBCATEGORIES
Category.destroy_all
Subcategory.destroy_all
categories = [
  {:name => "Category 1"},
  {:name => "Category 2"},
  {:name => "Category 3"},
  {:name => "Category 4"},
  {:name => "Category 5"},
  {:name => "Category 6"},
  {:name => "Category 7"}
]
subcategories = [
  {:name => "Subcategory 1"},
  {:name => "Subcategory 2"},
  {:name => "Subcategory 3"}
]
categories.each do |category|
  new_category = Category.new(category)
  new_category.save
  subcategories.each do |subcategory|
    new_subcategory = new_category.subcategories.new(subcategory)
    new_subcategory.save
  end
end

#CREATING PRODUCTS
Product.destroy_all
Article.destroy_all
products = [
  {:name => "Product 1", :description => "Description for product 1", :price_for_sale => 12, :color => "red,gree,blue"},
  {:name => "Product 2", :description => "Description for product 2", :price_for_sale => 12, :color => "red,gree,blue"},
  {:name => "Product 3", :description => "Description for product 3", :price_for_sale => 12, :color => "red,gree,blue"},
  {:name => "Product 4", :description => "Description for product 4", :price_for_sale => 12, :color => "red,gree,blue"},
  {:name => "Product 5", :description => "Description for product 5", :price_for_sale => 12, :color => "red,gree,blue"},
  {:name => "Product 6", :description => "Description for product 6", :price_for_sale => 12, :color => "red,gree,blue"}
]
products.each do |product|
  new_product = Product.new(product)
  Subcategory.all.each  do |subcategory|
    new_product.articles.new(:subcategory => subcategory)
    new_product.save
  end
end


# => Category(id: integer, name: string, created_at: datetime, updated_at: datetime)
# => Subcategory(id: integer, name: string, category_id: integer, created_at: datetime, updated_at: datetime) 
# => Product(id: integer, name: string, description: text, price_for_sale: float, discount: float, color: string, created_at: datetime, updated_at: datetime) 